# Earnings Configuration

## Document status

This document contains **proposed, fictional configuration designs** for Northstar Services Group (NSG). It does not describe settings verified in a Workday tenant. Payroll, tax, finance, HR, and change-approval owners must approve applicable assumptions before implementation.

## Design principles

- Give each earning a unique, stable code and a clear payslip label.
- Effective-date changes at the start of a payroll period unless an approved exception is documented.
- Define eligibility independently from the calculation method.
- Record tax, overtime, retroactivity, costing, and reporting decisions explicitly.
- Test positive, negative, boundary, retroactive, reversal, and termination scenarios where relevant.
- Never use real worker data in design or validation evidence stored in this repository.

## Proposed earning codes

| Code | Name | Category | Proposed effective date | Eligibility | Calculation method | Key validation considerations | Approval assumptions |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `REG_HR` | Regular Hourly Pay | Regular | Existing baseline; sample date `2027-01-01` | Active hourly workers in `NSG_BIWEEKLY_US` | Approved hourly rate multiplied by eligible regular hours | Rate and hours source, partial periods, rounding, retro time, zero hours, costing, and payslip display | Payroll owner must confirm rounding, time-source, and retro rules. |
| `REG_SAL` | Regular Salary | Regular | Existing baseline; sample date `2027-01-01` | Active salaried workers in an eligible US pay group | Annual salary divided by the approved number of pay periods | New hires, terminations, unpaid leave, proration, pay-group transfers, and year-to-date reconciliation | Payroll and HR owners must approve proration and period-divisor rules. |
| `OT_15` | Overtime 1.5x | Overtime | Existing baseline; sample date `2027-01-01` | Eligible non-exempt hourly workers with approved overtime hours | Approved overtime hours multiplied by `1.5` and the approved regular-rate basis | Regular-rate basis, multiple earning interactions, time approval, rounding, retro corrections, and jurisdiction rules | Payroll and compliance owners must confirm eligibility and regular-rate treatment. |
| `BONUS_DISC` | Discretionary Bonus | Supplemental | `2027-02-01` | Active workers included in an approved bonus award file | One-time flat amount from an approved input | Duplicate awards, inactive workers, supplemental taxation, payment date, costing, reversal, and reconciliation to the award total | HR, finance, payroll, and tax owners must approve the population, amount, and tax treatment. |
| `HOME_STIP` | Home Office Stipend | Allowance | First full biweekly period on or after `2027-01-01` | Active hybrid workers assigned to `NSG_BIWEEKLY_US` | `USD 50.00` per eligible pay period | Eligibility changes, leave and termination, duplicate payment, taxable wages, overtime exclusion, payslip display, costing, and first-period boundary | HR must approve eligibility. Payroll and tax owners must approve tax and overtime treatment. Finance must approve costing. |
| `EXP_REIM` | Approved Expense Reimbursement | Reimbursement | `2027-01-01` | Active workers with an approved fictional expense record | Approved reimbursable amount, limited to the supported expense | Duplicate expense IDs, amount limit, approval evidence, taxable treatment, reversal, and accounting | Finance and payroll owners must approve reimbursement controls. Tax owner must confirm treatment. |

## Effective dating

1. Use the start of a payroll period for new recurring earnings where practical.
2. Reject overlapping effective-dated rows for the same code and population unless the design explicitly supports them.
3. Document late changes and retroactive implications in the change request.
4. End-date an earning only after confirming future payroll, retro, integration, and reporting impacts.
5. Validate the first eligible period, the last ineligible period, and any pay-group transfer boundary.

## Eligibility and calculation controls

- Eligibility should reference stable business attributes such as worker status, pay group, worker type, work arrangement, or an approved one-time population.
- Manual overrides require a reason, authorized role, review evidence, and audit trail.
- Flat amounts must state currency and frequency.
- Percentage or multiplier calculations must identify the approved calculation base.
- Amounts must follow the payroll owner's rounding convention and should not be rounded early in intermediate calculations.
- The proposed `HOME_STIP` must not pay more than once per biweekly period.

## Validation requirements

At minimum, validate:

- One eligible and one ineligible fictional worker.
- Effective-date boundaries before, on, and after the start date.
- New hire, termination, leave, and pay-group transfer cases.
- Zero, negative, unusually high, and duplicate inputs where the method accepts input amounts.
- Gross-to-net, taxable wage, overtime-base, costing, payslip, and reporting results.
- Reversal, correction, and rollback behavior.
- Reconciliation of input totals to calculated payroll totals.

## Required approvals and unresolved assumptions

The examples assume USD payroll and the fictional NSG organization. Taxability, overtime inclusion, proration, retroactivity, and accounting treatment are not final. A qualified payroll or business owner must approve them, and a qualified tax or compliance owner must review tax-related decisions.

## Related documents

- [Payroll configuration guide](../docs/payroll-configuration-guide.md)
- [Project overview and reference scenario](../docs/project-overview.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
- [Fictional earning sample data](../sample-data/sample-earnings.csv)
