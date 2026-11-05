# End-to-End Payroll Change Simulation

## Purpose and status

This report demonstrates the fictional lifecycle of `PCR-2027-001`, a proposed `HOME_STIP` earning for Northstar Services Group. Every result, approval, implementation event, evidence reference, person, and defect is simulated. Nothing in this report represents live Workday configuration, authorized tenant testing, or an actual payroll result.

## Traceability map

| Artifact | Reference |
| --- | --- |
| Filled fictional request | [Example change request](../change-management/example-change-request-pcr-2027-001.md) |
| Governing request format | [Change request template](../change-management/change-request-template.md) |
| Configuration design | [Earnings configuration](../configuration/earnings-configuration.md), code `HOME_STIP` |
| Change-log record | [Change log](../change-management/change-log.xlsx), record `PCR-2027-001` |
| Test cases | [Test-case workbook](../validation-testing/test-cases.xlsx), `TC-EAR-001` through `TC-EAR-004` |
| Defects | [Defect tracker](../validation-testing/defect-tracking.xlsx), including `DEF-2027-001` |
| Validation control | [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md) |
| Summary evidence | `FIC-EV-001` and the `SIM-*` references below |

## Simulated lifecycle

### 1. Request submission and completeness

On fictional date `2026-11-02`, an HR policy requester submitted a proposal to pay eligible hybrid workers `USD 50.00` once per biweekly period starting `2027-01-04`. The payroll change coordinator assigned `PCR-2027-001` and confirmed that the business reason, population, earning code, effective date, owners, risks, testing approach, and rollback concept were complete.

### 2. Impact and risk review

The review classified the change High risk because it could affect gross pay, taxable wages, accounting, and payslip output. Dependencies included the `NSG_BIWEEKLY_US` pay group, `NSG_BIWEEKLY_2027` calendar, fictional tax treatment, eligibility data, payroll reports, costing, and role-based access.

The design assumed the stipend was taxable and excluded from the overtime base for this fictional scenario. Qualified payroll, tax, compliance, and legal owners would have to approve real treatment.

### 3. Approval to build and test

Business, payroll, tax/compliance, finance, security, test, and change-approval roles recorded simulated approvals. Approval evidence references `SIM-APR-PCR-2027-001-01` through `SIM-APR-PCR-2027-001-06` were linked to the request. The requester/configurator was not the sole approver or verifier.

### 4. Simulated test execution

The test records use status `Simulated`, not `Passed`, because no authorized tenant execution occurred.

| Test ID | Type | Simulated outcome | Evidence | Defect |
| --- | --- | --- | --- | --- |
| `TC-EAR-001` | Positive | One modeled `USD 50.00` payment for an eligible worker. | `SIM-EV-PCR-2027-001-01` | None |
| `TC-EAR-002` | Negative | No modeled payment for an ineligible worker. | `SIM-EV-PCR-2027-001-02` | None |
| `TC-EAR-003` | Boundary | Initial rule design allowed a duplicate-payment risk at the first-period boundary. | `SIM-EV-PCR-2027-001-03` | `DEF-2027-001` |
| `TC-EAR-004` | Regression | Modeled `REG_HR` and `OT_15` results remained unchanged. | `SIM-EV-PCR-2027-001-04` | None |

The fictional correction for `DEF-2027-001` added a uniqueness condition for worker, earning code, and payroll period. A simulated retest used reference `SIM-EV-PCR-2027-001-05`.

### 5. Implementation decision

The simulated approval group reviewed the request, impact assessment, approvals, test records, defect disposition, access plan, communication plan, calendar timing, and rollback procedure. It recorded a simulated decision to proceed with the documentation exercise on `2027-01-03` with conditions that any implementation use an authorized role and independent verification.

No live configuration was implemented. Reference `SIM-IMP-PCR-2027-001-01` exists only to demonstrate how an implementation record would link to the change.

The tracker retains open examples `DEF-2027-002` and `DEF-2027-004`. The High, Blocked retest on `DEF-2027-004` would prevent a real implementation. It does not prevent completion of this documentation-only simulation because the simulation does not authorize or perform a tenant change.

### 6. Verification and audit logging

The simulated verifier reviewed effective dating, eligibility, one-payment-per-period logic, modeled taxable wages, costing, payslip output, regression comparisons, access separation, and evidence traceability. Verification reference `SIM-VER-PCR-2027-001-01` is fictional.

The change-log example records `PCR-2027-001`, the summarized status, approvals, simulated test outcome, implementation decision, verification, closure, and evidence reference `FIC-EV-001`. The audit package links every stage by change ID.

### 7. Closure

The scenario records closure of the documentation exercise on `2027-01-08` after reviewing the defect correction, simulated retest, verification, evidence references, and open follow-up items. Closure evidence is `SIM-CLOSE-PCR-2027-001-01`. It does not close the tracker’s open defects, authorize implementation, or prove that Workday or payroll was changed.

## Process gaps and recommended improvements

| Gap identified | Risk | Recommended improvement |
| --- | --- | --- |
| Test cases originally used `CHG-NSG-001` while the change log used `PCR-2027-001`. | Traceability can break across artifacts. | Use the assigned `PCR-YYYY-NNN` identifier in every request, test, defect, evidence file, and log record. |
| Evidence references are manually entered. | Missing or duplicate references may not be detected. | Add a controlled evidence index and automated duplicate/missing-reference validation. |
| Simulation and authorized execution can share similar result language. | Readers could mistake fictional outcomes for live results. | Require the `Simulated` status and a visible environment field in test, defect, and summary artifacts. |
| Approval authority is described by role but not connected to an authoritative roster. | An approver may act outside delegated authority. | Maintain a controlled approval-authority register with effective dates and deputies. |
| The current workbooks do not automatically reconcile tests to defects and closure. | Closed changes may retain open defects or missing tests. | Add a future cross-artifact validation report or governed system-of-record workflow. |
| Rollback timing is qualitative. | Recovery may exceed the payroll cutoff. | Require a rehearsal estimate, latest safe rollback time, and accountable decision owner for high-risk changes. |
| Access evidence depends on manual review. | Temporary or excess access may persist. | Automate expiry where possible and reconcile privileged access after each implementation window. |

## Outcome

The simulation demonstrates complete traceability from request through closure while clearly separating fictional evidence from authorized execution. The most important improvement is consistent use of `PCR-2027-001` across the request, log, tests, defects, and evidence.
