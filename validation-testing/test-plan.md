# Payroll Configuration Validation Test Plan

## Purpose and status

This plan defines proposed validation activities for the fictional Northstar Services Group (NSG) payroll configuration scenario. All tests and results in this repository are **simulated unless they are executed in an authorized, access-controlled test environment and supported by retained evidence**. This document does not confirm testing in a Workday tenant or any production environment.

## Test objectives

- Confirm that proposed earnings, deductions, pay groups, payroll calendars, tax-rule changes, and security controls behave as approved.
- Detect incorrect eligibility, calculation, effective dating, sequencing, access, reporting, or approval behavior before implementation.
- Reconcile expected and actual gross-to-net, tax, deduction, payment, accounting, and reporting outcomes where applicable.
- Provide traceable evidence for approval, implementation, rollback, and closure decisions.

## Scope

### In scope

| Area | Minimum coverage |
| --- | --- |
| Earnings | Eligibility, rate or amount, calculation base, effective dates, proration, overtime interaction, taxable treatment, retroactivity, reversal, costing, payslip, and reporting. |
| Deductions | Enrollment, eligibility, amount or percentage, limits, priority, arrears, insufficient net pay, effective dates, reversal, remittance, accounting, and reporting. |
| Pay groups | Assignment rules, frequency, transfers, new hires, terminations, off-cycle restrictions, and population reconciliation. |
| Payroll calendars | Sequential periods, gaps and overlaps, cutoff sequencing, calculation and audit dates, payment dates, holiday adjustments, integrations, and year boundaries. |
| Tax rules | Jurisdiction, wage basis, effective dates, limits, withholding and employer liability, year-to-date values, reversals, reporting, and authoritative expected results. |
| Security controls | Least privilege, role scope, approval boundaries, segregation of duties, temporary access, audit evidence, and access removal. |
| Regression | Unchanged earnings, deductions, pay groups, calendars, tax results, integrations, reports, and security behavior affected by the proposed change. |

### Out of scope

- Production configuration or production payroll execution.
- Validation using real worker, bank, tax, benefit, or personally identifiable information.
- Legal or tax interpretation, statutory-rate certification, penetration testing, and vendor certification.
- Any tenant feature or integration not identified by the approved change request and impact assessment.

## Assumptions

- Only fictional NSG workers, codes, amounts, dates, and jurisdictions are used.
- Expected results are approved independently and are not derived solely from the system being tested.
- The configuration baseline, change request, impact assessment, security scope, and rollback plan are approved before execution.
- Testers have only the access required for their assigned environment and responsibilities.
- Calendar and tax examples require business-owner review before operational use.

## Responsibilities

| Role | Responsibility |
| --- | --- |
| Change owner | Maintains scope, traceability, decisions, and resolution of open actions. |
| Payroll configuration owner | Provides the approved design and corrects configuration defects without self-approving results. |
| Test lead | Plans execution, assigns testers, controls test data, reviews evidence, and reports status. |
| Test executor | Performs documented steps, records actual results, attaches evidence, and raises defects. |
| Payroll owner | Approves payroll expected results, reconciliations, residual risk, and exit decisions. |
| Tax/compliance owner | Approves tax assumptions, jurisdictional expected results, and tax-related defect disposition. |
| Security owner | Approves test access and reviews security and segregation-of-duties results. |
| Business/benefits/finance owners | Approve requirements and expected results within their areas. |
| Independent verifier | Reviews material results, defects, reconciliations, and evidence where practical. |

## Test-environment requirements

- An authorized non-production environment with documented owner, purpose, and access restrictions.
- A known configuration baseline and recorded version or refresh date.
- Approved fictional test workers and inputs with no production personal data.
- Required payroll, time, benefits, tax, accounting, banking, reporting, and integration components available or explicitly simulated.
- Date controls that support the required effective-date and payroll-period scenarios.
- Logging, audit history, evidence capture, and defect tracking enabled.
- Environment changes frozen or coordinated during execution so results remain reproducible.
- Production-like security roles without copying unnecessary production access.

If an authorized environment is unavailable, the test case must remain `Not Executed` or `Blocked`; a desk review or spreadsheet calculation may be labeled `Simulated` but not `Passed` as tenant validation.

## Test approach

The test suite includes:

- **Positive tests:** approved eligible inputs produce the expected result.
- **Negative tests:** ineligible, unauthorized, incomplete, or invalid inputs are rejected or excluded.
- **Boundary tests:** effective dates, limits, period cutoffs, final balances, and other thresholds are tested immediately before, on, and after the boundary.
- **Regression tests:** previously approved behavior remains unchanged after the proposed change.

Each test case must link to the change ID and applicable configuration code, pay group, calendar, or security role. Retesting uses the same test ID with a new execution reference or versioned evidence; original failed evidence is retained.

## Entry criteria

Testing may start only when:

1. The change request is complete and approved for testing.
2. Requirements, configuration design, scope, risk, dependencies, and acceptance criteria are documented.
3. The test environment and fictional data are ready and access is approved.
4. Expected results and required reconciliations have an identified approver.
5. Test cases have prerequisites, steps, expected results, priority, and traceability.
6. Critical dependencies and known environment limitations are documented.
7. Rollback or correction procedures exist for material implementation risk.

## Evidence requirements

Evidence must be attributable, dated, readable, and linked to the test ID and execution. Depending on the test, retain:

- Input files or screenshots containing fictional data only.
- Configuration or security setup evidence appropriate to the tester's access.
- Calculation results, payslip output, reports, integration messages, and audit history.
- Expected-versus-actual reconciliation with explained rounding differences.
- Approval or independent-review evidence.
- Defect ID, retest result, and closure evidence when a test fails.

Evidence must exclude secrets and unnecessary sensitive data. Store it only in an approved location and record a stable reference in the test-case workbook.

## Defect severity and handling

| Severity | Definition | Examples | Required action |
| --- | --- | --- | --- |
| Critical | Could cause material incorrect pay, legal or tax exposure, unauthorized privileged access, payment failure, or widespread data compromise with no acceptable workaround. | Incorrect net pay for a broad population; unauthorized payroll administration; failed payment file. | Stop affected testing or implementation, notify the payroll owner and change approver immediately, assess rollback, and retest after correction. |
| High | Material requirement failure affecting a significant population or control, with a limited or high-risk workaround. | Wrong deduction priority; incorrect taxable wage basis; pay-group population omission. | Block exit unless an authorized owner documents exceptional acceptance and compensating controls. |
| Medium | Limited functional or control failure with an acceptable temporary workaround and no material payroll impact. | Incorrect report label; isolated role scope issue caught before use. | Correct and retest, or obtain documented deferred-remediation approval before exit. |
| Low | Cosmetic, documentation, or usability issue with no payroll calculation, security, compliance, or operational impact. | Nonmaterial display wording or formatting issue. | Track for correction or approved closure; does not independently block exit. |

Unexpected payroll results are escalated to the test lead and payroll owner. Tax, legal, security, finance, treasury, integration, or incident owners are added according to the impact. Critical or high failures trigger review of affected tests, regression scope, implementation readiness, and rollback criteria.

## Exit criteria

Testing is complete only when:

1. All required tests have an actual result, status, evidence reference, and reviewer disposition.
2. All critical and high defects are closed and successfully retested, unless a formally authorized exception permits otherwise.
3. Medium and low defects have approved owners, target dates, and residual-risk decisions.
4. Required positive, negative, boundary, and regression coverage is complete.
5. Payroll totals and other required outputs reconcile to approved expectations.
6. Security and segregation-of-duties checks are complete.
7. The test lead and applicable payroll, tax, security, business, benefits, and finance owners provide required sign-off.
8. Evidence is stored in the approved location and traceable to the change request.

## Deliverables

- [Test-case workbook](test-cases.xlsx)
- [Payroll validation checklist](payroll-validation-checklist.md)
- Defect records in the approved defect tracker
- Reconciliation and evidence references
- Test summary and sign-off record linked to the change request

## Related documents

- [Change request template](../change-management/change-request-template.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Approval workflow](../change-management/change-approval-workflow.md)
- [Rollback procedure](../change-management/rollback-procedure.md)
- [Earnings configuration](../configuration/earnings-configuration.md)
- [Deductions configuration](../configuration/deductions-configuration.md)
- [Pay groups configuration](../configuration/pay-groups-configuration.md)
- [Payroll calendars](../configuration/payroll-calendars.md)
- [Tax rules configuration](../configuration/tax-rules-configuration.md)
- [Access-control guidelines](../security/access-control-guidelines.md)
- [Role-permission matrix](../security/role-permission-matrix.xlsx)
