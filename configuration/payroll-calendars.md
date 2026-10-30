# Payroll Calendars

## Document status

These entries are fictional planning examples for Northstar Services Group. Dates must be reviewed against actual banking holidays, company closures, processing service levels, funding deadlines, and applicable requirements before use.

## Calendar field definitions

| Field | Definition |
| --- | --- |
| Period start and end | Inclusive dates used to group regular payroll activity. |
| Input cutoff | Proposed deadline for approved payroll inputs and time data. |
| Calculation date | Proposed date for the primary payroll calculation. |
| Audit date | Proposed deadline for payroll review, issue correction, and approval. |
| Payment date | Proposed date funds are available to workers. |
| Adjustment reason | Explanation for a weekend, holiday, closure, or approved exception. |

## Sample 2027 schedule

| Pay group | Period | Period start | Period end | Input cutoff | Calculation date | Audit date | Payment date | Adjustment reason |
| --- | ---: | --- | --- | --- | --- | --- | --- | --- |
| `NSG_BIWEEKLY_US` | 1 | `2026-12-21` | `2027-01-03` | `2027-01-04` | `2027-01-05` | `2027-01-06` | `2027-01-08` | None in fictional schedule |
| `NSG_BIWEEKLY_US` | 2 | `2027-01-04` | `2027-01-17` | `2027-01-15` | `2027-01-19` | `2027-01-20` | `2027-01-22` | Proposed early cutoff due to holiday; requires validation |
| `NSG_BIWEEKLY_US` | 3 | `2027-01-18` | `2027-01-31` | `2027-02-01` | `2027-02-02` | `2027-02-03` | `2027-02-05` | None in fictional schedule |
| `NSG_BIWEEKLY_US` | 4 | `2027-02-01` | `2027-02-14` | `2027-02-12` | `2027-02-16` | `2027-02-17` | `2027-02-19` | Proposed early cutoff due to holiday; requires validation |
| `NSG_SEMIMONTHLY_US` | 1 | `2027-01-01` | `2027-01-15` | `2027-01-11` | `2027-01-12` | `2027-01-13` | `2027-01-15` | None in fictional schedule |
| `NSG_SEMIMONTHLY_US` | 2 | `2027-01-16` | `2027-01-31` | `2027-01-25` | `2027-01-26` | `2027-01-27` | `2027-01-29` | Payment moved before weekend period end |
| `NSG_SEMIMONTHLY_US` | 3 | `2027-02-01` | `2027-02-15` | `2027-02-08` | `2027-02-09` | `2027-02-10` | `2027-02-12` | Proposed early payment requires holiday validation |
| `NSG_SEMIMONTHLY_US` | 4 | `2027-02-16` | `2027-02-28` | `2027-02-22` | `2027-02-23` | `2027-02-24` | `2027-02-26` | Payment moved before weekend period end |

## Calendar governance

1. Payroll prepares the full annual calendar and records the source used for holiday and banking review.
2. HR, time, benefits, finance, treasury, and integration owners review their deadlines.
3. Payroll documents every nonstandard payment date and obtains approval before publication.
4. Changes after publication require impact analysis, communication, testing, and approval under the change-governance procedure.
5. The approved calendar is version controlled. Superseded versions remain traceable.

## Validation requirements

- Periods must be sequential, non-overlapping, and free of gaps for each regular pay group.
- Payment dates must follow the approved frequency and holiday rule.
- Processing steps must allow enough time for input, calculation, audit, funding, and settlement.
- Year-end periods must assign wages and reporting to the correct calendar year under approved rules.
- Downstream time, benefits, bank, accounting, and reporting schedules must align.
- Sample dates must not be treated as operational dates until the payroll owner approves them.

## Related documents

- [Pay group definitions](pay-groups-configuration.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
- [Fictional payroll calendar CSV](../sample-data/sample-payroll-calendar.csv)
