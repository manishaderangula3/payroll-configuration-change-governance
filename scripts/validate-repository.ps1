[CmdletBinding()]
param()

$ErrorActionPreference = 'Stop'
$repoRoot = (Resolve-Path (Join-Path $PSScriptRoot '..')).Path
$qaErrors = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

function Add-Error([string]$Message) { $qaErrors.Add($Message) }
function Add-Warning([string]$Message) { $warnings.Add($Message) }

function Get-ColumnIndex([string]$CellReference) {
    $letters = ([regex]::Match($CellReference, '^[A-Z]+')).Value
    $index = 0
    foreach ($character in $letters.ToCharArray()) {
        $index = ($index * 26) + ([int][char]$character - [int][char]'A' + 1)
    }
    return $index - 1
}

function Get-XlsxRows([string]$Path, [string]$HeaderName) {
    Add-Type -AssemblyName System.IO.Compression.FileSystem
    $archive = [System.IO.Compression.ZipFile]::OpenRead($Path)
    try {
        $strings = @()
        $sharedEntry = $archive.GetEntry('xl/sharedStrings.xml')
        if ($sharedEntry) {
            $reader = [System.IO.StreamReader]::new($sharedEntry.Open())
            try { [xml]$sharedXml = $reader.ReadToEnd() } finally { $reader.Dispose() }
            $strings = @($sharedXml.sst.si | ForEach-Object { $_.InnerText })
        }

        $worksheetEntries = @($archive.Entries | Where-Object { $_.FullName -match '^xl/worksheets/sheet\d+\.xml$' })
        foreach ($entry in $worksheetEntries) {
            $reader = [System.IO.StreamReader]::new($entry.Open())
            try { [xml]$sheetXml = $reader.ReadToEnd() } finally { $reader.Dispose() }
            $rows = @()
            foreach ($rowNode in @($sheetXml.worksheet.sheetData.row)) {
                $values = @{}
                foreach ($cell in @($rowNode.c)) {
                    $column = Get-ColumnIndex ([string]$cell.r)
                    $value = ''
                    if ([string]$cell.t -eq 's' -and $null -ne $cell.v) {
                        $value = $strings[[int]$cell.v]
                    } elseif ([string]$cell.t -eq 'inlineStr') {
                        $value = [string]$cell.is.InnerText
                    } elseif ($null -ne $cell.v) {
                        $value = [string]$cell.v
                    }
                    $values[$column] = $value
                }
                if ($values.Count -gt 0) { $rows += ,$values }
            }

            $headerPosition = -1
            for ($i = 0; $i -lt $rows.Count; $i++) {
                if ($rows[$i].Values -contains $HeaderName) { $headerPosition = $i; break }
            }
            if ($headerPosition -lt 0) { continue }

            $headers = @{}
            foreach ($key in $rows[$headerPosition].Keys) { $headers[[int]$key] = [string]$rows[$headerPosition][$key] }
            $records = @()
            for ($i = $headerPosition + 1; $i -lt $rows.Count; $i++) {
                $record = @{}
                foreach ($key in $headers.Keys) {
                    $record[$headers[$key]] = if ($rows[$i].ContainsKey($key)) { [string]$rows[$i][$key] } else { '' }
                }
                if (($record.Values -join '').Length -gt 0) { $records += ,$record }
            }
            return $records
        }
        return @()
    } finally {
        $archive.Dispose()
    }
}

$requiredPaths = @(
    'README.md', 'RELEASE_NOTES.md', '.gitignore',
    'scripts/validate-repository.ps1', '.github/workflows/repository-qa.yml',
    '.github/ISSUE_TEMPLATE/payroll-change.yml', '.github/PULL_REQUEST_TEMPLATE.md',
    'integrations/workflow-system-integration.md', 'integrations/workflow-field-mapping.csv',
    'validation-testing/authorized-environment-execution-plan.md',
    'reports/traceability-report.xlsx', 'reports/evidence-index.xlsx',
    'reports/operational-metrics-dashboard.xlsx', 'security/authorized-approver-register.xlsx'
)
foreach ($relativePath in $requiredPaths) {
    if (-not (Test-Path -LiteralPath (Join-Path $repoRoot $relativePath))) { Add-Error "Missing required path: $relativePath" }
}

$markdownFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.md' | Where-Object { $_.FullName -notmatch '[\\/]\.git[\\/]' }
foreach ($file in $markdownFiles) {
    $content = Get-Content -LiteralPath $file.FullName -Raw
    foreach ($match in [regex]::Matches($content, '\[[^\]]+\]\(([^)]+)\)')) {
        $target = $match.Groups[1].Value.Trim().Trim('<', '>')
        if ($target -match '^(https?://|mailto:|#)') { continue }
        $pathOnly = [uri]::UnescapeDataString(($target -split '#', 2)[0])
        if ([string]::IsNullOrWhiteSpace($pathOnly)) { continue }
        $resolved = Join-Path $file.DirectoryName ($pathOnly -replace '/', [IO.Path]::DirectorySeparatorChar)
        if (-not (Test-Path -LiteralPath $resolved)) {
            Add-Error "Broken Markdown link in $($file.FullName.Substring($repoRoot.Length + 1)): $target"
        }
    }
}

function Test-CsvFile([string]$RelativePath, [string[]]$RequiredColumns, [string[]]$DateColumns, [string[]]$KeyColumns) {
    $path = Join-Path $repoRoot $RelativePath
    if (-not (Test-Path -LiteralPath $path)) { Add-Error "Missing CSV: $RelativePath"; return @() }
    $rows = @(Import-Csv -LiteralPath $path)
    if ($rows.Count -eq 0) { Add-Error "CSV has no records: $RelativePath"; return @() }
    $headers = @($rows[0].PSObject.Properties.Name)
    foreach ($column in $RequiredColumns) {
        if ($column -notin $headers) { Add-Error "Missing column '$column' in $RelativePath" }
    }
    $keys = @{}
    foreach ($row in $rows) {
        foreach ($column in $RequiredColumns) {
            if ([string]::IsNullOrWhiteSpace([string]$row.$column)) { Add-Error "Missing '$column' in $RelativePath" }
        }
        foreach ($column in $DateColumns) {
            $value = [string]$row.$column
            if ($value -and $value -notmatch '^\d{4}-\d{2}-\d{2}$') { Add-Error "Invalid ISO date '$value' in $RelativePath column $column" }
        }
        $key = (($KeyColumns | ForEach-Object { [string]$row.$_ }) -join '|')
        if ($keys.ContainsKey($key)) { Add-Error "Duplicate key '$key' in $RelativePath" } else { $keys[$key] = $true }
    }
    return $rows
}

$earningRows = Test-CsvFile 'sample-data/sample-earnings.csv' @('earning_code','earning_name','category','effective_start','pay_group','status') @('effective_start','effective_end') @('earning_code')
$deductionRows = Test-CsvFile 'sample-data/sample-deductions.csv' @('deduction_code','deduction_name','category','effective_start','pay_group','status') @('effective_start','effective_end') @('deduction_code')
$calendarRows = Test-CsvFile 'sample-data/sample-payroll-calendar.csv' @('pay_group_code','calendar_code','frequency','period_number','period_start','period_end','payment_date','status') @('period_start','period_end','input_cutoff','calculation_date','audit_date','payment_date') @('calendar_code','period_number')
$mappingRows = Test-CsvFile 'integrations/workflow-field-mapping.csv' @('canonical_field','repository_artifact','external_system_field','direction','required','validation_rule','classification','owner_role') @() @('canonical_field')

$knownPayGroups = @('NSG_BIWEEKLY_US','NSG_SEMIMONTHLY_US')
foreach ($row in @($earningRows) + @($deductionRows)) {
    if ($row.pay_group -notin $knownPayGroups) { Add-Error "Unknown pay group '$($row.pay_group)' in sample configuration data" }
}
foreach ($row in $calendarRows) {
    if ($row.pay_group_code -notin $knownPayGroups) { Add-Error "Unknown pay group '$($row.pay_group_code)' in payroll calendar" }
    if ([datetime]$row.period_start -gt [datetime]$row.period_end) { Add-Error "Period start is after period end for $($row.calendar_code) period $($row.period_number)" }
}

$xlsxFiles = Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.xlsx'
Add-Type -AssemblyName System.IO.Compression.FileSystem
foreach ($file in $xlsxFiles) {
    try {
        $archive = [System.IO.Compression.ZipFile]::OpenRead($file.FullName)
        try {
            if (-not $archive.GetEntry('xl/workbook.xml')) { Add-Error "Invalid XLSX package: $($file.Name)"; continue }
            $xmlText = ($archive.Entries | Where-Object { $_.FullName -like '*.xml' } | ForEach-Object {
                $reader = [System.IO.StreamReader]::new($_.Open())
                try { $reader.ReadToEnd() } finally { $reader.Dispose() }
            }) -join "`n"
            if ($xmlText -match '#REF!|#DIV/0!|#VALUE!|#NAME\?|#NUM!|#NULL!|#SPILL!|#CALC!') { Add-Error "Formula error token found in $($file.Name)" }
            if ($xmlText -notmatch '<(?:\w+:)?autoFilter') { Add-Error "No filter definition found in $($file.Name)" }
        } finally { $archive.Dispose() }
    } catch { Add-Error "Unable to inspect workbook $($file.Name): $($_.Exception.Message)" }
}

$changeRows = @(Get-XlsxRows (Join-Path $repoRoot 'change-management/change-log.xlsx') 'Change ID')
$testRows = @(Get-XlsxRows (Join-Path $repoRoot 'validation-testing/test-cases.xlsx') 'Test ID')
$defectRows = @(Get-XlsxRows (Join-Path $repoRoot 'validation-testing/defect-tracking.xlsx') 'Issue ID')
$evidenceRows = @(Get-XlsxRows (Join-Path $repoRoot 'reports/evidence-index.xlsx') 'Evidence ID')

function Test-UniqueField($Rows, [string]$Field, [string]$Source) {
    $seen = @{}
    foreach ($row in $Rows) {
        $value = [string]$row[$Field]
        if (-not $value) { Add-Error "Missing $Field in $Source"; continue }
        if ($seen.ContainsKey($value)) { Add-Error "Duplicate $Field '$value' in $Source" } else { $seen[$value] = $true }
    }
}
Test-UniqueField $changeRows 'Change ID' 'change log'
Test-UniqueField $testRows 'Test ID' 'test cases'
Test-UniqueField $defectRows 'Issue ID' 'defect tracker'
Test-UniqueField $evidenceRows 'Evidence ID' 'evidence index'

$changeIds = @($changeRows | ForEach-Object { [string]$_['Change ID'] })
$testIds = @($testRows | ForEach-Object { [string]$_['Test ID'] })
$plannedMissingChanges = @{}
foreach ($row in $testRows) {
    if ([string]$row['Change ID'] -notin $changeIds) {
        if ([string]$row['Status'] -eq 'Not Executed') {
            $missingChange = [string]$row['Change ID']
            if (-not $plannedMissingChanges.ContainsKey($missingChange)) { $plannedMissingChanges[$missingChange] = 0 }
            $plannedMissingChanges[$missingChange]++
        } else {
            Add-Error "Test $($row['Test ID']) references unknown change $($row['Change ID'])"
        }
    }
}
foreach ($missingChange in $plannedMissingChanges.Keys) {
    Add-Warning "$($plannedMissingChanges[$missingChange]) planned Not Executed tests reference $missingChange, which has no change-log record."
}
foreach ($row in $defectRows) {
    if ([string]$row['Change ID'] -notin $changeIds) { Add-Error "Defect $($row['Issue ID']) references unknown change $($row['Change ID'])" }
    if ([string]$row['Test ID'] -notin $testIds) { Add-Error "Defect $($row['Issue ID']) references unknown test $($row['Test ID'])" }
}
foreach ($row in $evidenceRows) {
    $changeId = [string]$row['Change ID']
    if ($changeId -and $changeId -notin $changeIds) { Add-Error "Evidence $($row['Evidence ID']) references unknown change $changeId" }
}

foreach ($change in $changeRows | Where-Object { [string]$_['Closure Status'] -eq 'Closed' }) {
    $openDefects = @($defectRows | Where-Object { [string]$_['Change ID'] -eq [string]$change['Change ID'] -and [string]$_['Closure Status'] -ne 'Closed' })
    if ($openDefects.Count -gt 0) { Add-Warning "Closed example $($change['Change ID']) has $($openDefects.Count) non-closed defect(s); confirm the documented simulation exception." }
}

Write-Host "Repository QA summary"
Write-Host "Markdown files: $($markdownFiles.Count)"
Write-Host "Excel workbooks: $($xlsxFiles.Count)"
Write-Host "CSV datasets: $((Get-ChildItem -LiteralPath $repoRoot -Recurse -File -Filter '*.csv').Count)"
Write-Host "Errors: $($qaErrors.Count)"
Write-Host "Warnings: $($warnings.Count)"
foreach ($warning in $warnings) { Write-Warning $warning }
foreach ($errorMessage in $qaErrors) { Write-Host "ERROR: $errorMessage" -ForegroundColor Red }
if ($qaErrors.Count -gt 0) { exit 1 }
Write-Host 'Repository QA passed.'

