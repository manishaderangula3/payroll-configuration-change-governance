# Example Change Request — PCR-2027-001

## Simulation notice

This is a fictional completed example for Northstar Services Group. All people, dates, approvals, test outcomes, implementation events, and evidence references are simulated. It is not a record of live Workday configuration or payroll processing.

## Request control

| Field | Fictional response |
| --- | --- |
| Change ID | `PCR-2027-001` |
| Change title | Add Home Office Stipend for eligible hybrid workers |
| Final simulated status | `Closed` |
| Requester | Maya Chen, HR Policy Lead (fictional) |
| Business owner | Director of People Operations (fictional) |
| Change owner | Payroll Change Coordinator (fictional) |
| Submitted | `2026-11-02` |
| Requested effective date | `2027-01-04` |
| Priority and risk | High |

## Business requirement and scope

NSG proposed a `USD 50.00` home-office stipend once per eligible biweekly pay period for active fictional hybrid workers in `NSG_BIWEEKLY_US`. The proposed earning code is `HOME_STIP`. The change affects earning eligibility, gross pay, assumed taxable wages, costing, payslip presentation, payroll reporting, and related approval and audit controls.

Acceptance criteria were:

- One stipend per eligible worker and biweekly period beginning `2027-01-04`.
- No stipend for ineligible workers or periods before the effective date.
- No change to existing `REG_HR` or `OT_15` results outside the approved design.
- Approved fictional tax, overtime, costing, and payslip assumptions are documented.
- Positive, negative, boundary, and regression tests are recorded with sanitized evidence references.

## Impact, assumptions, and approvals

The request was classified High risk because it could affect pay and taxable wages. The fictional approval route included HR policy, payroll, tax/compliance, finance, security, test, and change-approval roles.

| Review | Simulated decision | Evidence reference |
| --- | --- | --- |
| Business requirement and population | Approved | `SIM-APR-PCR-2027-001-01` |
| Payroll design and timing | Approved with conditions | `SIM-APR-PCR-2027-001-02` |
| Tax treatment | Approved for fictional scenario only | `SIM-APR-PCR-2027-001-03` |
| Finance costing | Approved | `SIM-APR-PCR-2027-001-04` |
| Security and segregation of duties | Approved | `SIM-APR-PCR-2027-001-05` |
| Approval to build and test | Approved | `SIM-APR-PCR-2027-001-06` |

Conditions required the earning to pay no more than once per period, preserve existing earning results, and remain labeled fictional until qualified owners approve real treatment.

## Simulated testing and defects

The change maps to test cases `TC-EAR-001` through `TC-EAR-004` in the [test-case workbook](../validation-testing/test-cases.xlsx). The scenario uses the shared execution status `Simulated`; it does not claim authorized tenant execution.

| Test ID | Simulated outcome | Evidence | Defect |
| --- | --- | --- | --- |
| `TC-EAR-001` | Eligible worker produced one modeled `USD 50.00` stipend. | `SIM-EV-PCR-2027-001-01` | None |
| `TC-EAR-002` | Ineligible worker produced no modeled stipend. | `SIM-EV-PCR-2027-001-02` | None |
| `TC-EAR-003` | Boundary review exposed a duplicate-payment risk in the initial rule design. | `SIM-EV-PCR-2027-001-03` | `DEF-2027-001` |
| `TC-EAR-004` | Modeled regression comparison found no change to `REG_HR` or `OT_15`. | `SIM-EV-PCR-2027-001-04` | None |

`DEF-2027-001` was corrected in the fictional design by enforcing one payment per worker, earning code, and pay period. The simulated retest used `SIM-EV-PCR-2027-001-05`. Other example defects are maintained in the [defect tracker](../validation-testing/defect-tracking.xlsx).

## Implementation decision

The fictional approval group reviewed the simulated tests, defect disposition, residual risk, access plan, communications, and rollback procedure. It recorded a simulated decision to proceed with the documentation exercise on `2027-01-03`, conditional on authorized implementation access and post-change verification.

No live Workday implementation occurred. For portfolio simulation only, the sequence records an implementation event on `2027-01-04` with reference `SIM-IMP-PCR-2027-001-01`.

Open examples `DEF-2027-002` and `DEF-2027-004` remain tracked. `DEF-2027-004` would block any real implementation until an authorized regression test and qualified expected results are available. Closing this documentation simulation does not close those defects or approve a live change.

## Verification, audit logging, and closure

The fictional independent verifier reviewed the proposed configuration, effective date, population rule, modeled calculation, regression comparison, evidence links, and access separation. Verification reference `SIM-VER-PCR-2027-001-01` records a simulated outcome.

The [change log](change-log.xlsx) contains record `PCR-2027-001` and summary evidence reference `FIC-EV-001`. Closure of the documentation exercise was simulated on `2027-01-08` after the defect disposition, evidence cross-check, and owner review. Closure reference is `SIM-CLOSE-PCR-2027-001-01`; it is not approval to close the open defects or implement the change in a live environment.

## Traceability

- [Change request template](change-request-template.md)
- [Earnings configuration](../configuration/earnings-configuration.md) — `HOME_STIP`
- [Impact assessment](change-impact-assessment.md)
- [Approval workflow](change-approval-workflow.md)
- [Change log](change-log.xlsx) — `PCR-2027-001`
- [Test cases](../validation-testing/test-cases.xlsx) — `TC-EAR-001` through `TC-EAR-004`
- [Defect tracker](../validation-testing/defect-tracking.xlsx) — `DEF-2027-001`
- [Validation checklist](../validation-testing/payroll-validation-checklist.md)
- [Rollback procedure](rollback-procedure.md)
- [End-to-end simulation and outcomes](../reports/project-outcomes.md)
