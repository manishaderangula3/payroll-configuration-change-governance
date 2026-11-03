# Payroll Change Impact Assessment

## Purpose and status

Use this assessment to identify the full effect of a proposed payroll configuration change before approval to build and test. It supports the fictional Northstar Services Group governance model and does not confirm an actual Workday tenant configuration.

The assessment must reference the originating [change request](change-request-template.md) and use the same change ID.

## Assessment control

| Field | Required response |
| --- | --- |
| Change ID | `[PCR-YYYY-NNN]` |
| Change title | `[Concise title]` |
| Change owner | `[Accountable owner]` |
| Assessor and date | `[Name/role and YYYY-MM-DD]` |
| Requested effective date | `[YYYY-MM-DD]` |
| Overall risk | `[Low / Medium / High / Emergency]` |
| Risk justification | `[Highest applicable impact and rationale]` |

## Assessment criteria

For each area, record `No Impact`, `Low`, `Medium`, `High`, or `Unknown`, followed by evidence and an owner. An `Unknown` item prevents final impact approval until it is resolved or formally accepted by an authorized approver.

| Impact area | Review criteria | Rating | Evidence, assumption, or decision | Owner |
| --- | --- | --- | --- | --- |
| Worker pay | Gross-to-net result, frequency, proration, rounding, retroactivity, reversals, and final pay | `[rating]` | `[details]` | `[owner]` |
| Earnings and deductions | Eligibility, calculation bases, limits, priority, arrears, and interactions | `[rating]` | `[details]` | `[owner]` |
| Pay groups and calendars | Population, transfers, cutoffs, payment dates, banking deadlines, and year boundaries | `[rating]` | `[details]` | `[owner]` |
| Tax and compliance | Jurisdictions, taxable wages, pretax treatment, limits, reporting, and regulatory authority | `[rating]` | `[details]` | `[owner]` |
| Accounting and finance | Costing, employer liabilities, general-ledger mapping, funding, and reconciliation | `[rating]` | `[details]` | `[owner]` |
| Benefits and time | Elections, eligibility, time inputs, leave, and downstream calculations | `[rating]` | `[details]` | `[owner]` |
| Security and access | Roles, privileged access, approval boundaries, and segregation of duties | `[rating]` | `[details]` | `[owner]` |
| Integrations | Inbound and outbound files, schedules, field mapping, error handling, and monitoring | `[rating]` | `[details]` | `[owner]` |
| Reporting and payslips | Labels, audit reports, operational reports, regulatory outputs, and worker communications | `[rating]` | `[details]` | `[owner]` |
| Data and privacy | Sensitive data, retention, access, evidence sanitization, and data transfer | `[rating]` | `[details]` | `[owner]` |
| Operations | Staffing, procedures, training, support, payroll deadlines, and business continuity | `[rating]` | `[details]` | `[owner]` |
| Historical results | Year-to-date balances, retroactive periods, prior filings, corrections, and audit trail | `[rating]` | `[details]` | `[owner]` |

## Dependencies

Identify dependencies before approval. Record `None` only after review.

- Other open or scheduled change IDs.
- Payroll calendars, processing cutoffs, bank holidays, and funding deadlines.
- Worker, organization, location, company, pay-group, or eligibility data.
- Time, benefits, absence, compensation, finance, security, tax, reporting, and integration teams.
- Vendor releases, regulatory guidance, external filing schedules, and third-party services.
- Required access, non-production environment availability, test data, and migration tooling.
- Communications, training, support coverage, and business-owner availability.
- Rollback feasibility and the latest safe decision point.

| Dependency | Owner | Required date | Status | Effect if unavailable |
| --- | --- | --- | --- | --- |
| `[dependency]` | `[owner]` | `[YYYY-MM-DD]` | `[Open / Ready / Blocked / Not Applicable]` | `[effect]` |

## Risk classification

Assign the overall rating from the highest material impact. Do not average a high-risk area down to a lower rating.

| Risk | Characteristics | Governance response |
| --- | --- | --- |
| Low | Documentation-only or narrow change with no expected pay-result, tax, security, integration, or material financial impact | Payroll owner review, proportionate testing, and documented closure |
| Medium | Controlled pay impact, limited population, standard configuration, or reversible operational change | Business and payroll approval, documented test plan, independent review, and rollback readiness |
| High | Tax, broad population, pay group, calendar, privileged security, integration, retroactive, year-end, or material financial impact | Cross-functional approvals, independent testing, implementation approval, heightened verification, and explicit rollback decision |
| Emergency | Immediate action needed to prevent or contain payroll harm and the standard timeline cannot be followed | Emergency authorization, documented compensating controls, focused validation, and mandatory retrospective review |

The following normally require a `High` rating unless an authorized governance owner documents a justified alternative: tax logic, pay-group frequency, payment dates, privileged access, broad-population calculations, retroactive changes, year-end reporting, and critical integrations.

## Affected payroll processes

Select and explain every affected process:

- [ ] Worker eligibility and pay-group assignment
- [ ] Time and absence input
- [ ] Earnings calculation
- [ ] Deduction calculation and arrears
- [ ] Gross-to-net calculation
- [ ] Tax withholding and employer liabilities
- [ ] Retroactive payroll and corrections
- [ ] Off-cycle or final pay
- [ ] Payment election, settlement, and funding
- [ ] Payslip and worker communication
- [ ] Accounting and reconciliation
- [ ] Integrations and file monitoring
- [ ] Regulatory and operational reporting
- [ ] Security administration and audit
- [ ] Year-end processing

## Testing and acceptance impact

The assessor must identify the minimum test coverage and acceptance criteria for the [test plan](../validation-testing/test-plan.md).

Required considerations include:

- Positive, negative, and ineligible population scenarios.
- Effective-date boundaries and period cutoffs.
- Calculation, rounding, limits, priority, and frequency.
- Retroactive, reversal, correction, and rollback scenarios.
- Tax, accounting, security, integration, reporting, and payslip outputs.
- Regression coverage for unaffected calculations and populations.
- Independent expected results and reconciliation controls.

## Assessment outcome

| Decision | Meaning |
| --- | --- |
| Proceed to approval | Scope, risk, dependencies, approvers, testing, and rollback ownership are complete. |
| Return for clarification | Information is incomplete, inconsistent, or unsupported. |
| Defer | A dependency, timing issue, or unresolved decision prevents progress. |
| Reject | The risk or business case is unacceptable. |

Record the decision, decision owner, date, open conditions, and the approval stage required by the [approval workflow](change-approval-workflow.md).

## Related documents

- [Change request template](change-request-template.md)
- [Payroll change process](../business-processes/payroll-change-process.md)
- [Approval matrix](../business-processes/approval-matrix.xlsx)
- [Rollback procedure](rollback-procedure.md)
- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
