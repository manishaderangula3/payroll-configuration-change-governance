# Payroll Configuration Guide

## Purpose and status

This guide explains the business purpose of five core payroll configuration areas used in the project: earnings, deductions, pay groups, payroll calendars, and tax rules. It establishes terminology for later governance and testing artifacts.

All content is **proposed conceptual documentation** for the fictional Northstar Services Group scenario. It is not a Workday configuration procedure, tenant export, or record of an implemented setting.

## Configuration relationships

A payroll result is produced by several connected decisions:

1. A worker is assigned to an appropriate pay group.
2. The pay group follows a defined payroll calendar.
3. Eligible earnings determine amounts payable to the worker.
4. Deductions reduce gross or net pay according to their rules and priority.
5. Tax rules determine applicable employee and employer tax treatment.
6. Payroll results are validated, approved, paid, reconciled, and reported.

A change to one area can affect the others. Every proposal therefore requires impact analysis rather than isolated configuration.

## Earnings

Earnings represent amounts paid to a worker. Common examples include regular salary, hourly wages, overtime, bonus payments, allowances, commissions, and taxable benefits.

An earning design should document:

- Business purpose and owner.
- Eligible worker population and effective date.
- Calculation method, rate, amount, frequency, and currency.
- Taxable or non-taxable assumption, pending qualified review.
- Treatment in overtime, retroactive calculations, and other derived values.
- Payslip label, accounting treatment, reporting, and integration impacts.
- Required approvals, test cases, and rollback or inactivation approach.

For the reference scenario, the proposed **Home Office Stipend** is a flat biweekly earning for eligible hybrid workers. Its tax treatment is an explicit assumption requiring qualified confirmation before any real implementation.

## Deductions

Deductions represent amounts withheld from a worker's pay. Examples include benefit contributions, retirement contributions, garnishments, union dues, charitable contributions, loan repayments, and other voluntary deductions.

A deduction design should document:

- Mandatory or voluntary status.
- Pre-tax or post-tax assumption and the authority for that decision.
- Eligibility, enrollment source, effective dates, and end conditions.
- Flat amount, percentage, balance, limit, priority, and frequency.
- Arrears and insufficient-net-pay behavior.
- Recipient, remittance, reconciliation, accounting, and reporting requirements.
- Interaction with retroactive payroll, reversals, and corrections.

Deduction changes carry employee-pay and compliance risk, so negative-net-pay, limit, priority, and arrears scenarios require explicit testing.

## Pay groups

Pay groups organize workers who share payroll-processing characteristics. Frequency, calendar, country, company, worker type, and operational processing needs may influence the design.

A pay-group design should document:

- Population and eligibility criteria.
- Pay frequency and associated calendar.
- Assignment and transfer rules.
- Cutoff dates and processing responsibilities.
- Security access and operational ownership.
- Effects on time, benefits, integrations, accounting, reporting, and year-end processing.

The fictional organization uses a **Biweekly US** group for most workers and a **Semimonthly US** group for executives and senior leaders. These names and populations are illustrative only.

## Payroll calendars

Payroll calendars establish the timing of payroll periods and payments. A calendar commonly identifies period start, period end, payment date, and operational milestones or cutoffs.

A calendar design should document:

- Pay frequency and number of expected periods.
- Period start and end dates.
- Scheduled payment dates.
- Treatment of weekends, bank holidays, and year-end boundaries.
- Input, time-entry, approval, calculation, audit, and settlement deadlines.
- Off-cycle or emergency-pay expectations.
- Communication and downstream integration timing.

Calendar errors can cause late or incorrect pay. Dates should be independently reviewed against banking deadlines, holidays, operational capacity, and applicable requirements.

## Tax rules

Tax configuration supports the calculation, withholding, employer liability, reporting, and remittance of payroll taxes. It may depend on work location, residence, company registration, worker elections, taxable wage definitions, reciprocity, limits, and effective-dated regulatory rules.

A tax-related proposal should document:

- Jurisdiction and affected worker population.
- Business event and effective date.
- Taxable wage and deduction assumptions.
- Worker election or withholding-input dependencies.
- Reciprocity, supplemental wage, limit, and year-to-date considerations where applicable.
- Reporting, reconciliation, filing, and audit impacts.
- Evidence of review by qualified and authorized tax or compliance stakeholders.

Repository documentation must not be treated as tax advice. No tax setting should be implemented solely from this guide.

## Minimum governance record

Each proposed payroll configuration change should identify:

| Requirement | Expected evidence |
| --- | --- |
| Request | Unique identifier, requester, owner, date, and business justification |
| Scope | Affected configuration, workers, companies, locations, pay groups, and periods |
| Impact | Payroll, tax, accounting, security, integration, reporting, and compliance analysis |
| Design | Proposed values, effective dates, dependencies, and assumptions |
| Security | Required access and segregation-of-duties review |
| Testing | Test cases, expected results, actual results, defects, and approval evidence |
| Implementation | Authorized owner, timing, prerequisites, communications, and validation steps |
| Rollback | Decision criteria, responsible owner, feasible reversal steps, and data correction plan |
| Closure | Post-change validation, reconciliation, approvals, evidence links, and lessons learned |

## Proposed versus actual configuration

| Label | Meaning in this repository |
| --- | --- |
| Proposed configuration | A conceptual design awaiting review or approval. |
| Approved proposal | A design approved through the documented fictional governance workflow. It may still be unconfigured. |
| Actual Workday configuration | A tenant setting verified by an authorized person using authorized tenant evidence. The current repository contains none. |

Writers should avoid phrases such as "Workday is configured" or "the tenant uses" unless supporting tenant evidence exists. Preferred wording is "the project proposes," "the fictional scenario assumes," or "the design requires validation."
