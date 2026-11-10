# Release Notes

## v1.0.0 — Draft

**Prepared:** `2026-11-10`

**Status:** Ready for final review; not tagged or pushed

This draft release packages the completed payroll configuration change-governance documentation for the fictional Northstar Services Group. It is a documentation and simulation release, not a Workday deployment.

## Highlights

- Complete proposed governance lifecycle from request submission through closure and audit retention.
- Proposed earnings, deductions, pay groups, payroll calendars, and tax-rule documentation.
- Change request, impact assessment, approval workflow, rollback procedure, and fictional end-to-end example.
- Approval and role-permission matrices with segregation-of-duties and escalation controls.
- Test plan with 24 positive, negative, boundary, and regression cases across six coverage areas.
- Defect tracker, validation checklist, audit checklist, and screenshot-evidence guidance.
- Formula-driven change summary covering change volume, pending approvals, implementation status, non-closed defects, and overdue actions.
- Fictional earning, deduction, and payroll-calendar CSV datasets.
- Project outcomes, measured repository metrics, limitations, and future enhancements.

## Quality review

The Day 19 QA baseline covered 35 tracked files:

- 25 Markdown documents.
- 6 Excel-compatible workbooks.
- 3 CSV datasets.
- `.gitignore`.

The review confirmed working local relative links, expected repository folders, workbook sheets, formulas, dropdowns, filters, fictional example records, CSV headers, required fields, ISO dates, unique record keys, and pay-group references. It also standardized legacy test-case change references to `PCR-YYYY-NNN`.

Day 20 adds this release note, increasing the intended release package to 36 tracked files after staging and commit.

## Known limitations

- No Workday tenant was accessed, configured, or tested.
- All organization, payroll, person, approval, evidence, test, and defect data is fictional or simulated.
- Proposed roles, approval boundaries, tax assumptions, security rules, and retention requirements require organizational and jurisdiction-specific validation.
- The workbooks demonstrate governance controls but are not a production workflow or evidence-management system.
- No external legal, tax, vendor, or tenant-specific behavior was validated.

## Release decision

The proposed version is `v1.0.0`. Create an annotated `v1.0.0` tag only after:

1. The final README and these release notes receive review approval.
2. Repository checks complete without errors.
3. The Day 20 changes are committed to the intended branch.
4. The release owner confirms that no confidential or production payroll information is present.

No tag or remote push is included in the Day 20 preparation task.
