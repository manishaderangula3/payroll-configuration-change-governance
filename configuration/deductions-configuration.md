# Deductions Configuration

## Document status

This document contains **proposed, fictional deduction designs** for Northstar Services Group. It is not evidence of configured Workday deductions. Benefit, payroll, legal, tax, finance, and business owners must approve decisions within their authority before any implementation.

## Design principles

- Use stable codes and distinguish employee deductions from employer contributions.
- State whether the deduction is voluntary or mandatory and whether the proposed treatment is pre-tax or post-tax.
- Define eligibility, calculation base, limits, priority, arrears, and insufficient-net-pay behavior.
- Effective-date enrollment and rate changes without overlapping active records.
- Reconcile deductions to elections, third-party obligations, accounting, and remittance totals.

## Proposed deduction categories

| Code | Name | Category | Proposed effective date | Eligibility | Calculation method | Key validation considerations | Approval assumptions |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `MED_EE` | Medical Employee Contribution | Benefit | `2027-01-01` | Active benefit-eligible workers with an approved fictional medical election | Flat amount per pay period based on coverage tier | Election-to-payroll mapping, coverage changes, pay frequency, leave, arrears, insufficient net pay, and year-end reconciliation | Benefits and payroll owners must approve rates, frequency conversion, arrears, and priority. Tax owner must confirm pre-tax treatment. |
| `RET_401K` | Employee Retirement Contribution | Retirement | `2027-01-01` | Active eligible workers with a valid fictional election | Elected percentage of the approved eligible compensation base | Percentage limits, eligible earnings, catch-up rules, zero/negative pay, annual limits, refunds, retro pay, and plan reconciliation | Benefits, payroll, and plan owners must approve the compensation base and limits. Tax/legal review is required. |
| `GARN_ORD` | Fictional Garnishment Order | Statutory order | Order-specific; sample date `2027-01-01` | Only the fictional worker associated with an approved test order | Lesser of the authorized flat amount or the amount allowed by approved withholding rules | Priority, disposable-pay basis, protected earnings, competing orders, insufficient net pay, balance, termination, and remittance | Legal and payroll owners must approve every rule. Sample values are not legal guidance. |
| `CHARITY` | Voluntary Charity Contribution | Voluntary | `2027-01-01` | Active workers with an approved fictional election | Flat post-tax amount per pay period | Start/end dates, election changes, duplicate deductions, insufficient net pay, reversal, and recipient reconciliation | Payroll owner must approve minimum-net-pay handling and remittance controls. |
| `EQUIP_REPAY` | Equipment Repayment | Voluntary repayment | Agreement-specific; sample date `2027-02-01` | Worker with an approved fictional repayment agreement | Flat post-tax amount until the approved balance reaches zero | Opening balance, final partial deduction, leave, termination, over-collection, manual adjustment, and reconciliation | HR, payroll, and legal owners must approve authorization, balance, and collection rules. |

## Effective dating and enrollment

1. Use the approved election, order, or agreement effective date and retain its reference identifier.
2. Prevent overlapping active elections for the same worker, deduction, and coverage or agreement type.
3. Apply end dates consistently to future regular, off-cycle, and retroactive payroll calculations.
4. Document corrections separately from prospective rate changes.
5. Validate enrollment start, change, suspension, resumption, and end boundaries.

## Calculation, priority, and arrears

- Percentage deductions must identify which earning codes form the calculation base.
- Flat deductions must state currency and frequency.
- Balance-based deductions must stop at zero and calculate a final partial amount when needed.
- Priority and insufficient-net-pay behavior must be documented for every category.
- Arrears should be created, recovered, limited, or waived only under an approved policy.
- Mandatory orders must be reviewed by qualified legal and payroll owners. This project does not define legal withholding rules.

## Validation requirements

At minimum, validate:

- Eligible, ineligible, enrolled, and non-enrolled fictional workers.
- Effective-date boundaries and mid-period changes.
- Regular pay, low net pay, zero pay, retro pay, reversal, and off-cycle scenarios.
- Percentage base, flat amount, limit, balance, final partial deduction, and rounding.
- Priority and interaction with other deductions.
- Taxable wages, net pay, accounting, payslip, remittance, and reporting.
- Reconciliation to fictional elections, orders, agreements, and recipient totals.

## Required approvals and unresolved assumptions

The sample data uses simplified fictional rates and balances. Pre-tax treatment, annual limits, protected-pay rules, deduction priority, arrears, and legal-order calculations require approval from the appropriate business, payroll, benefits, legal, tax, or plan owner.

## Related documents

- [Payroll configuration guide](../docs/payroll-configuration-guide.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
- [Fictional deduction sample data](../sample-data/sample-deductions.csv)
