# Pay Groups Configuration

## Document status

The following pay groups are fictional proposed designs for Northstar Services Group. They are not verified Workday pay groups.

## Proposed pay group definitions

| Code | Name | Frequency | Expected periods | Proposed population | Calendar | Primary owner | Approval assumptions |
| --- | --- | --- | --- | --- | --- | --- | --- |
| `NSG_BIWEEKLY_US` | NSG Biweekly US | Every two weeks | 26 in a standard year; 27 can occur depending on calendar alignment | Approximately 220 active US salaried and hourly workers outside the executive population | `NSG_BIWEEKLY_2027` | Payroll Operations | HR and payroll owners must approve assignment rules, frequency, period count, and transfer timing. |
| `NSG_SEMIMONTHLY_US` | NSG Semimonthly US | Twice each month | 24 | Approximately 30 executives and senior leaders | `NSG_SEMIMONTHLY_2027` | Payroll Operations | HR and payroll owners must approve the population and proration rules. |
| `NSG_OFFCYCLE_US` | NSG US Off-Cycle | Event driven | No fixed count | Approved corrections, final pay, or urgent payments for eligible US workers | Approved off-cycle schedule | Payroll Manager | Use requires documented reason, approval, funding, validation, and reconciliation. |

## Assignment rules

- Assign each worker to one primary regular pay group for a given effective-dated period.
- Base assignment on company, country, worker type, payroll frequency, and approved population rules.
- Use the start of a regular pay period for transfers where practical.
- Review mid-period transfers for duplicate or missing pay, proration, benefit deductions, tax, time, and year-to-date impacts.
- Restrict off-cycle group use to authorized payroll roles and approved events.

## Frequency definitions

- **Biweekly:** one regular pay period every 14 days. The annual number of payments depends on calendar alignment.
- **Semimonthly:** two regular payments each month, producing 24 regular payments per year.
- **Off-cycle:** an exceptional payroll outside the regular frequency. It does not replace the worker's regular pay group.

## Validation requirements

- Reconcile assigned fictional workers to the approved population criteria.
- Confirm that every regular pay group has one complete approved calendar.
- Validate new hire, termination, leave, company transfer, and pay-group transfer cases.
- Confirm correct earning and deduction frequency conversion.
- Verify security access, integrations, reports, accounting, time inputs, and benefits interfaces.
- Test year-start, year-end, and any 27th-biweekly-payment condition before a real calendar is approved.

## Related documents

- [Payroll calendars](payroll-calendars.md)
- [Payroll configuration guide](../docs/payroll-configuration-guide.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Test plan](../validation-testing/test-plan.md)
- [Fictional payroll calendar sample data](../sample-data/sample-payroll-calendar.csv)
