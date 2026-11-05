# Payroll Validation Checklist

## Purpose and status

Use this checklist to confirm that a proposed payroll configuration change has the required design, approval, access, validation, implementation, and audit controls. It is a governance example for the fictional Northstar Services Group (NSG). A checked item represents a simulated review unless the evidence reference proves execution in an authorized environment.

## Status vocabulary

The checklist, [test-case workbook](test-cases.xlsx), and retest-result field in the [defect tracker](defect-tracking.xlsx) use the same execution statuses:

| Status | Meaning |
| --- | --- |
| `Not Executed` | No authorized execution or documented simulation has started. |
| `In Progress` | Execution has started but evidence or review is incomplete. |
| `Passed` | An authorized execution met the expected result and evidence requirements. |
| `Failed` | An authorized execution did not meet the expected result. |
| `Blocked` | Execution cannot continue because a prerequisite, access, environment, or decision is missing. |
| `Simulated` | A fictional desk review or modeled result was completed; it is not a live Workday result. |

Defect workflow uses separate closure values—`Open`, `In Progress`, `Deferred`, and `Closed`—because issue closure is different from test execution status.

## Checklist control information

| Field | Value |
| --- | --- |
| Change ID | `[PCR-YYYY-NNN]` |
| Change title | `[Title]` |
| Test cycle or execution ID | `[Identifier]` |
| Environment | `[Authorized environment or Simulated]` |
| Test lead | `[Name or role]` |
| Payroll owner | `[Name or role]` |
| Review date | `[YYYY-MM-DD]` |
| Overall execution status | `[Not Executed / In Progress / Passed / Failed / Blocked / Simulated]` |
| Evidence location | `[Approved sanitized reference]` |

## 1. Configuration checks

- [ ] `CFG-01` The change ID, title, owner, business reason, scope, and requested effective date are complete.
- [ ] `CFG-02` The proposed configuration is distinguished from verified tenant configuration.
- [ ] `CFG-03` Earning, deduction, pay-group, calendar, tax-rule, or security identifiers match the approved design.
- [ ] `CFG-04` Effective start and end dates align with the approved payroll period and do not create unintended overlaps.
- [ ] `CFG-05` Eligibility and population criteria are explicit, testable, and reconciled to the approved scope.
- [ ] `CFG-06` Calculation method, amount, rate, currency, frequency, rounding, proration, and limits are documented where applicable.
- [ ] `CFG-07` Taxability, overtime basis, deduction priority, arrears, limits, and jurisdictional assumptions have qualified owners.
- [ ] `CFG-08` Pay-group assignment and payroll-calendar references are valid and consistent.
- [ ] `CFG-09` Payroll periods contain no unexplained gaps, overlaps, duplicate period numbers, or invalid processing sequences.
- [ ] `CFG-10` Integrations, accounting, reporting, payslip, audit, and downstream dependencies are identified.
- [ ] `CFG-11` Retroactive, reversal, correction, off-cycle, leave, new-hire, termination, and transfer effects are assessed as applicable.
- [ ] `CFG-12` Configuration evidence is sanitized, attributable, dated, and linked to the change ID.

## 2. Approval and governance checks

- [ ] `APR-01` The change request passed the mandatory-field completeness review.
- [ ] `APR-02` The impact assessment documents risk, dependencies, affected processes, required approvers, and acceptance criteria.
- [ ] `APR-03` Business, payroll, tax/compliance, finance, benefits, legal, security, integration, and testing reviews are assigned where required.
- [ ] `APR-04` Approval decisions are explicit, dated, attributable, and within the approver's authority.
- [ ] `APR-05` `Approved with Conditions`, `Deferred`, or `Not Required` decisions include justification, conditions, owners, and dates.
- [ ] `APR-06` The requester, configurator, implementer, tester, approver, and verifier do not provide the sole approval for their own work.
- [ ] `APR-07` Material scope, timing, tax, calculation, risk, or rollback changes were returned to the appropriate earlier approval gate.
- [ ] `APR-08` Final implementation approval considers test evidence, open defects, residual risk, rollback readiness, timing, and communications.

## 3. Access and security checks

- [ ] `SEC-01` Test and implementation access is approved for the correct person, role, environment, organization, and time window.
- [ ] `SEC-02` Access follows least privilege and excludes unnecessary payroll, tax, bank, worker, or security data.
- [ ] `SEC-03` Production access is approved separately from non-production access.
- [ ] `SEC-04` Segregation-of-duties conflicts are prevented or documented with approved compensating controls.
- [ ] `SEC-05` Shared accounts are not used for attributable configuration, approval, testing, or verification activity.
- [ ] `SEC-06` Temporary and emergency access has an expiry time, enhanced logging, and post-use review.
- [ ] `SEC-07` Access was independently verified after provisioning and removed or corrected when no longer required.
- [ ] `SEC-08` Evidence excludes credentials, secrets, real worker data, and unnecessary sensitive information.

## 4. Test and defect checks

- [ ] `TST-01` Test scope covers affected earnings, deductions, pay groups, calendars, tax rules, security, integrations, reports, and regression areas.
- [ ] `TST-02` Each test has a unique test ID, prerequisite, steps, expected result, priority, owner, and change reference.
- [ ] `TST-03` Positive, negative, boundary, and regression cases are included.
- [ ] `TST-04` Expected results are approved independently and are not derived only from the system being tested.
- [ ] `TST-05` Test data is fictional or otherwise authorized and contains no unapproved production personal data.
- [ ] `TST-06` Actual results, execution status, date, tester, reviewer, and evidence reference are recorded.
- [ ] `TST-07` Simulations use status `Simulated` and are not presented as authorized tenant results.
- [ ] `TST-08` Failed or blocked tests reference a defect, prerequisite, or decision record.
- [ ] `TST-09` Defects contain severity, impact, root cause, owner, corrective action, target date, retest result, evidence, and closure status.
- [ ] `TST-10` Critical and high defects block exit unless an authorized exception and compensating controls are documented.
- [ ] `TST-11` Closed defects have correction evidence, a successful authorized retest or clearly labeled simulation, and closure approval.
- [ ] `TST-12` Required totals, payroll outputs, taxes, deductions, accounting, reports, and interfaces reconcile to approved expectations.

## 5. Implementation, rollback, and verification checks

- [ ] `IMP-01` The authorized implementer, target environment, schedule, steps, prerequisites, and communication plan are documented.
- [ ] `IMP-02` The rollback or correction plan identifies triggers, decision owner, recovery steps, time limit, and verification method.
- [ ] `IMP-03` Payroll cutoff, funding, settlement, integration, reporting, and business blackout constraints are confirmed.
- [ ] `IMP-04` Implementation evidence records the actual timestamp, actor, result, deviations, and configuration reference.
- [ ] `IMP-05` An independent verifier confirms configuration, effective date, population, calculation, tax, accounting, reporting, integration, and security results as applicable.
- [ ] `IMP-06` Unexpected payroll results follow the escalation and rollback decision path.
- [ ] `IMP-07` Post-change verification records exceptions, corrective actions, reconciliation, and acceptance or rollback decision.

## 6. Audit and closure checks

- [ ] `AUD-01` The change request, approvals, impact assessment, tests, defects, implementation decision, verification, and closure are linked by one change ID.
- [ ] `AUD-02` The change log reflects current lifecycle status, approvals, test result, implementation, verification, closure, and evidence reference.
- [ ] `AUD-03` Audit evidence is attributable, timestamped, readable, retained in an approved location, and protected from unauthorized change.
- [ ] `AUD-04` Evidence references remain stable and do not expose real payroll data or confidential credentials.
- [ ] `AUD-05` Open actions have an owner, due date, risk decision, and follow-up mechanism.
- [ ] `AUD-06` Closure approval confirms the final outcome, defect disposition, evidence retention, reconciliation, communications, and lessons learned.
- [ ] `AUD-07` The process owner records identified gaps and approved improvements for future changes.

## Exceptions and sign-off

Unchecked mandatory items must be resolved, documented as not applicable with an approved reason, or recorded as an exception. An exception does not convert a failed or blocked test to `Passed`.

| Decision | Owner | Date | Evidence or conditions |
| --- | --- | --- | --- |
| Test lead recommendation | `[role]` | `[YYYY-MM-DD]` | `[reference]` |
| Payroll owner decision | `[role]` | `[YYYY-MM-DD]` | `[reference]` |
| Change approver decision | `[role]` | `[YYYY-MM-DD]` | `[reference]` |

## Related documents

- [Test plan](test-plan.md)
- [Test cases](test-cases.xlsx)
- [Defect tracker](defect-tracking.xlsx)
- [Change request template](../change-management/change-request-template.md)
- [Change approval workflow](../change-management/change-approval-workflow.md)
- [Rollback procedure](../change-management/rollback-procedure.md)
- [Access-control guidelines](../security/access-control-guidelines.md)
