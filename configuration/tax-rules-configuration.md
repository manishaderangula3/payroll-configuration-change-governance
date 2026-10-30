# Tax Rules Configuration

## Document status

This document defines a governance framework for proposed payroll tax-rule changes. It does not provide tax advice, statutory rates, or tenant configuration instructions. Only qualified and authorized tax, legal, payroll, and compliance owners may approve real tax treatment.

## Governance principles

- Maintain an authoritative external source for each jurisdictional requirement and record the retrieval date.
- Separate research, configuration, testing, approval, and production-promotion duties where practical.
- Treat vendor or system updates as changes that still require impact review and validation.
- Never infer tax treatment from an earning or deduction name alone.
- Retain evidence of the approved rule, effective date, affected population, testing, reconciliation, and sign-off.

## Rule inventory fields

Every proposed tax rule should record:

| Field | Required detail |
| --- | --- |
| Rule identifier | Stable internal reference linked to the change request |
| Jurisdiction | Federal, state, local, or other applicable authority |
| Tax type | Employee withholding, employer liability, unemployment, local tax, or reporting-only rule |
| Authority | Current authoritative source and retrieval date |
| Effective date | Statutory or approved start date and any end date |
| Population | Company, location, resident/work jurisdiction, worker type, and other eligibility criteria |
| Wage basis | Included and excluded earnings and applicable deduction effects |
| Calculation inputs | Elections, filing status, limits, thresholds, reciprocity, or other authorized inputs |
| Dependencies | Payroll calendar, work location, resident address, company registration, integrations, and reporting |
| Evidence | Review, approval, test results, reconciliation, and implementation record |

## Effective dating

1. Use the legally or administratively required effective date, supported by an authoritative source.
2. Evaluate retroactive impact when a rule is received or configured after its effective date.
3. Do not overwrite the prior rule. Preserve effective-dated history and the reason for change.
4. Validate year-to-date balances, limits, quarter boundaries, year-end reporting, reversals, and amended results.
5. Coordinate effective dates with payroll calendars and processing cutoffs.

## Jurisdictional considerations

- Work and resident locations may create different obligations.
- State or local reciprocity may affect withholding but requires qualified review.
- Employer registration and work-location setup may affect whether a jurisdiction can be processed.
- Supplemental earnings, taxable benefits, reimbursements, pretax deductions, and imputed income may require different treatment.
- Limits and thresholds can apply by employee, employer, jurisdiction, year, quarter, or wage base.
- Remote and hybrid work can change jurisdictional obligations. Location data and effective dates must be controlled.
- The fictional states used in this project are New York, New Jersey, and Pennsylvania. No rates or legal conclusions are asserted.

## Review and approval requirements

| Review | Minimum expectation |
| --- | --- |
| Tax or compliance | Confirms authority, interpretation, jurisdiction, effective date, and wage treatment. |
| Payroll | Confirms configuration feasibility, population, calendar timing, retro impact, and operational readiness. |
| HR or business owner | Confirms worker policy, eligibility, and communication impacts. |
| Finance | Confirms employer cost, accounting, reconciliation, and reporting impacts. |
| Security | Confirms privileged access and segregation of duties. |
| Testing | Independently validates representative positive, negative, boundary, retro, and year-to-date scenarios. |
| Change approver | Confirms evidence, risk, timing, rollback or correction plan, and required sign-offs. |

## Validation requirements

- Test representative fictional workers for each affected work and resident jurisdiction combination.
- Confirm included and excluded earnings and deductions in the taxable-wage basis.
- Validate effective-date boundaries, retro changes, reversals, refunds, limits, and year-to-date accumulation.
- Reconcile employee withholding and employer liabilities to the approved expected results.
- Validate payslip, tax reporting, accounting, integration, and audit outputs.
- Record expected results from an independently approved source. Do not derive expected results only from the system being tested.

## Reference scenario assumptions

The proposed `HOME_STIP` earning is treated as taxable only for the fictional test scenario. That assumption requires written approval from qualified tax and payroll owners before any implementation. Its overtime and local-tax treatment also remains unresolved.

## Related documents

- [Earnings configuration](earnings-configuration.md)
- [Deductions configuration](deductions-configuration.md)
- [Project overview](../docs/project-overview.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
