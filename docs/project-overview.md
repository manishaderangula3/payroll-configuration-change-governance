# Project Overview

## 1. Document status

| Field | Value |
| --- | --- |
| Project | Payroll Configuration Change Governance |
| Reference organization | Northstar Services Group (fictional) |
| Document type | Proposed governance and design documentation |
| Current phase | Requirements and payroll overview |
| Production configuration represented | None |

This document defines the requirements and reference scenario for the project. It does not describe a verified Workday tenant, a production deployment, or an approved tax position.

## 2. Background

Payroll configuration changes can affect employee pay, taxes, accounting, compliance, security, integrations, and downstream reporting. Even a small change requires clear ownership, impact analysis, controlled access, repeatable testing, approval evidence, and a practical rollback decision.

This project establishes a reusable governance framework for documenting those activities. Workday Payroll terminology is used because it provides a realistic business context, but all configuration details remain conceptual until independently reviewed and verified by authorized stakeholders in an authorized tenant.

## 3. Objectives

The project objectives are to:

1. Create a centralized repository for payroll configuration and change-governance artifacts.
2. Define a controlled lifecycle for payroll changes from intake through post-implementation review.
3. Explain the business purpose and relationships of core payroll configuration components.
4. Define review, approval, security, testing, audit, and rollback expectations.
5. Create fictional sample data that supports repeatable walkthroughs and test scenarios.
6. Demonstrate traceability among business requirements, proposed design, approvals, test evidence, defects, and outcomes.
7. Distinguish clearly between recommendations documented in this repository and settings actually configured in Workday.

## 4. Scope

### 4.1 In scope

- Requirements and governance documentation for proposed payroll configuration changes.
- Conceptual design for earnings, deductions, pay groups, payroll calendars, and tax rules.
- Change requests, impact assessments, approval routing, change logging, and rollback planning.
- Security roles, access-control principles, and segregation-of-duties expectations.
- Test planning, test cases, payroll result validation, defect management, and evidence retention.
- Fictional sample records and management-reporting templates.
- Version control and peer-review practices for project artifacts.

### 4.2 Out of scope

- Direct access to, configuration of, or deployment into a Workday tenant.
- Production payroll processing or employee self-service activity.
- Real employee, customer, bank, tax, or personally identifiable information.
- Workday integrations, general-ledger configuration, benefits administration, time tracking, or recruiting configuration except where an interface impact must be noted.
- Interpretation of laws or provision of legal, payroll, tax, accounting, or compliance advice.
- Final authorization to promote any change to production.

## 5. Core payroll configuration overview

| Component | Business purpose | Key governance considerations |
| --- | --- | --- |
| Earnings | Define how workers receive amounts such as regular pay, overtime, bonuses, allowances, or reimbursements. An earning design may influence eligibility, calculation, taxation, accounting, payslip display, and reporting. | Business eligibility, calculation basis, taxable treatment, effective dating, accounting impact, retroactivity, and test coverage must be reviewed. |
| Deductions | Define amounts withheld from worker pay, such as benefit contributions, garnishments, repayments, or voluntary deductions. | Priority, limits, arrears behavior, pre-tax or post-tax treatment, eligibility, third-party obligations, and insufficient-net-pay handling require review. |
| Pay groups | Organize workers who share payroll-processing characteristics, such as frequency, calendar, country, or processing rules. | Transfers, eligibility, cutoffs, calendar alignment, reporting, security access, and downstream effects must be assessed. |
| Payroll calendars | Establish period start and end dates, payment dates, processing milestones, and cutoff expectations. | Weekends, holidays, banking deadlines, year-end boundaries, off-cycle processing, and stakeholder communications must be validated. |
| Tax configuration | Supports the determination and reporting of required payroll taxes based on jurisdiction, worker elections, taxable wages, and employer obligations. | Only qualified and authorized personnel should approve tax-related design. Jurisdiction, reciprocity, effective dates, taxable wage treatment, reporting, and regulatory validation are critical. |

These descriptions explain business purpose only. They are not instructions for entering values in Workday and do not assert that a tenant contains any particular object or rule.

## 6. Fictional organization

### 6.1 Organization profile

**Northstar Services Group (NSG)** is a fictional professional-services company headquartered in New York. It employs approximately 250 workers in New York, New Jersey, and Pennsylvania.

For this project, NSG is assumed to have:

- 220 salaried and hourly employees in a biweekly pay group.
- 30 executives and senior leaders in a semimonthly pay group.
- A calendar year from January through December.
- Direct deposit as the normal payment method.
- Regular, overtime, bonus, and reimbursement earning categories.
- Benefit, retirement, garnishment, and voluntary deduction categories.
- Payroll operations, HR operations, finance, information security, internal audit, and change-approval stakeholders.

NSG, its workers, identifiers, dates, and amounts are invented solely for this project.

### 6.2 Reference payroll scenario

NSG proposes a new **Home Office Stipend** earning for eligible hybrid workers beginning with the first full biweekly payroll period on or after `2027-01-01`.

Proposed business requirements:

- Eligible workers receive a flat `USD 50.00` per biweekly pay period.
- Eligibility is limited to active workers designated as hybrid and assigned to the biweekly pay group.
- The stipend appears as a separate payslip line.
- The scenario assumes the earning is taxable for testing purposes, subject to formal confirmation by qualified payroll and tax stakeholders before any real implementation.
- The earning must not be included in overtime-rate calculations unless a qualified review determines otherwise.
- The cost is assigned to a designated administrative expense account in the conceptual design.
- Retroactive use is disabled in the initial proposal.
- Payroll must be able to remove or inactivate the proposed earning if validation fails before deployment.

Expected governance path:

1. HR Operations submits a documented change request and business justification.
2. Payroll analyzes calculation, eligibility, tax, retroactivity, calendar, and payslip impacts.
3. Finance reviews costing and reporting impacts.
4. Security reviews access and segregation of duties.
5. Authorized tax and compliance stakeholders validate the proposed treatment.
6. Testers execute positive, negative, boundary, and regression scenarios using fictional workers.
7. Required approvers review evidence and decide whether the change is ready for promotion.
8. Payroll completes post-change validation and records the outcome, or executes the approved rollback approach.

The Home Office Stipend scenario will be reused across later configuration, workflow, security, testing, and reporting artifacts to maintain consistency.

## 7. Stakeholders and responsibilities

| Stakeholder | Primary responsibility |
| --- | --- |
| Project sponsor | Confirms business priority, funding, and acceptance criteria. |
| HR Operations | Owns the worker-policy requirement and eligibility definition. |
| Payroll Operations | Owns payroll requirements, processing impact, validation, and operational readiness. |
| Payroll configuration analyst | Documents the proposed design and maintains traceability; must not self-approve production promotion. |
| Tax or compliance specialist | Reviews tax and regulatory assumptions within their professional authority. |
| Finance or accounting | Reviews costing, reconciliation, reporting, and financial-control impacts. |
| Information security | Reviews role access, privileged activity, and segregation of duties. |
| Test lead or payroll tester | Plans tests, records evidence, and manages defects independently of configuration approval where practical. |
| Change approver or change advisory group | Reviews readiness, risks, approvals, and scheduling before promotion. |
| Internal audit | Evaluates whether controls and retained evidence are complete and consistently followed. |

## 8. Assumptions

- The organization and all sample data are fictional.
- The reference payroll is US-based and uses USD.
- Payroll terminology is aligned broadly with Workday concepts but may require tenant-specific confirmation.
- Effective-dated changes follow an approved payroll calendar and change window.
- Tax decisions require review by qualified, authorized stakeholders.
- Production configuration and migration duties are separated from request, testing, and approval duties where feasible.
- Every proposed change has a unique request identifier, owner, business justification, risk rating, implementation plan, test evidence, approvals, and rollback decision.
- No production data, credentials, confidential screenshots, or tenant exports will be stored in this repository.
- Workbook files in the repository will be populated in later project phases.

## 9. Constraints and dependencies

- No Workday tenant is connected to this repository.
- Tenant-specific business processes, security groups, domains, and configuration objects cannot be verified here.
- Regulatory and tax requirements may change and must be validated at the time of a real change.
- The quality of governance depends on accurate stakeholder input and complete evidence.
- Payroll calendars, banking deadlines, integrations, and downstream systems may constrain implementation timing.

## 10. Planned deliverables

| Deliverable group | Outputs |
| --- | --- |
| Foundation | README, repository structure, usage conventions, and project overview |
| Payroll documentation | Payroll configuration guide and configuration specifications for earnings, deductions, pay groups, calendars, and tax rules |
| Governance | Change procedure, request template, impact assessment, approval workflow, change log, and rollback procedure |
| Process design | Payroll change process, approval matrix, and process flow |
| Security | Security overview, role-permission matrix, access guidelines, and segregation-of-duties documentation |
| Validation | Test plan, test cases, validation checklist, and defect tracker |
| Data and reporting | Fictional CSV data, change summary, audit checklist, and project outcomes |

## 11. Success criteria

The project will be considered complete when:

- All planned artifacts are present, internally consistent, and version controlled.
- The fictional scenario is traceable across requirements, design, approval, testing, and reporting.
- Proposed configuration is never misrepresented as verified tenant configuration.
- Security, segregation-of-duties, audit, and rollback considerations are documented.
- Sample data contains no real or sensitive information.
- Reviewers can determine who requested, analyzed, approved, tested, and documented each example change.

## 12. Terminology and evidence standard

The following labels must be used consistently:

- **Proposed:** A recommendation or design documented for review; not verified in a tenant.
- **Approved:** A proposal that has received the documented business or governance approvals required by the fictional process; approval alone does not prove deployment.
- **Configured:** A setting entered in an authorized non-production or production tenant by an authorized administrator. This status requires tenant evidence and is not represented by the current repository.
- **Validated:** A result supported by documented test evidence and reviewer acceptance within a defined environment.
- **Deployed:** A change promoted to the target environment under an authorized change record. No deployment is performed as part of this repository.
