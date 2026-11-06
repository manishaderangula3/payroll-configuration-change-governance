# Payroll Change Audit Checklist

## Purpose and status

Use this checklist to evaluate whether a payroll configuration change has complete, attributable, protected, and traceable evidence from request through closure. It is a proposed control framework for the fictional Northstar Services Group (NSG), not evidence from a live Workday tenant.

All examples in this repository use fictional people, identifiers, amounts, and outcomes. Do not add real employee data, bank details, tax identifiers, credentials, confidential payroll results, or unredacted production screenshots.

## Audit control information

| Field | Audit entry |
| --- | --- |
| Change ID | `[PCR-YYYY-NNN]` |
| Change title | `[Title]` |
| Audit reviewer | `[Authorized role]` |
| Review date | `[YYYY-MM-DD]` |
| Environment | `[Simulated / authorized non-production / production]` |
| Evidence index | `[Approved controlled location]` |
| Overall result | `[Complete / Complete with Exceptions / Incomplete]` |
| Exception references | `[IDs or None]` |

## Evidence quality requirements

Evidence should be:

- **Attributable:** identifies the responsible person or approved role.
- **Dated:** includes the decision, execution, or capture date and time where material.
- **Traceable:** links to the change ID, test ID, defect ID, and evidence reference as applicable.
- **Complete:** includes inputs, decision context, result, exceptions, and follow-up actions.
- **Readable:** retains enough context to understand what was reviewed without exposing unnecessary data.
- **Protected:** stored in an approved location with access, integrity, retention, and disposal controls.
- **Sanitized:** excludes credentials, secrets, personal data, confidential payroll details, and unrelated information.
- **Accurately labeled:** distinguishes proposed design, simulation, authorized testing, and production evidence.

## Audit evidence matrix

Mark each item `Complete`, `Complete with Exception`, `Not Applicable`, or `Missing`. A `Not Applicable` result requires an approved explanation.

| ID | Evidence requirement | Evidence owner | Repository artifact | Minimum audit check |
| --- | --- | --- | --- | --- |
| `REQ-01` | Unique change ID, title, requester, owners, dates, priority, and status | Payroll change coordinator | [Change request template](../change-management/change-request-template.md) | Mandatory control fields are complete and consistent with the change log. |
| `REQ-02` | Business reason, expected outcome, acceptance criteria, and consequence of not implementing | Business owner | [Change request template](../change-management/change-request-template.md) | Requirement is specific, testable, and approved by the accountable owner. |
| `REQ-03` | Configuration scope, affected population, pay groups, periods, integrations, reports, and accounting effects | Change owner | [Change request template](../change-management/change-request-template.md) | Scope supports impact analysis and test coverage. |
| `REQ-04` | Fictional completed request example and traceability references | Change owner | [Example PCR-2027-001 request](../change-management/example-change-request-pcr-2027-001.md) | Example is clearly labeled fictional and links to its tests, defects, log, and evidence. |
| `IMP-01` | Completed impact assessment covering payroll processes, dependencies, risk, security, tax, reporting, and rollback | Change owner | [Change impact assessment](../change-management/change-impact-assessment.md) | Assessment identifies the highest applicable risk and required owners. |
| `APR-01` | Defined approval stages and authorized decision roles | Governance owner | [Approval workflow](../change-management/change-approval-workflow.md) | Approval route matches the risk, scope, and segregation-of-duties rules. |
| `APR-02` | Role-by-stage approval assignment | Governance owner | [Approval matrix](../business-processes/approval-matrix.xlsx) | Required and conditional approvers are identified before work proceeds. |
| `APR-03` | Attributable approval decisions, dates, conditions, and comments | Decision owner | [Change request template](../change-management/change-request-template.md) | Each decision is within authority; missing approval blocks the next gate. |
| `APR-04` | Exception approval, business reason, duration, compensating controls, expiry, and review | Governance owner | [Approval workflow](../change-management/change-approval-workflow.md) | Exception does not silently bypass a mandatory control. |
| `CFG-01` | Proposed earning code, eligibility, calculation, effective date, tax/overtime assumptions, and validation rules | Payroll configuration owner | [Earnings configuration](../configuration/earnings-configuration.md) | Evidence matches the approved request and remains labeled proposed unless verified. |
| `CFG-02` | Proposed deduction eligibility, rate or amount, limits, priority, arrears, and tax treatment | Payroll configuration owner | [Deductions configuration](../configuration/deductions-configuration.md) | Calculation and priority decisions have the required benefit, payroll, tax, or legal approval. |
| `CFG-03` | Pay-group definitions, population rules, frequency, and calendar assignment | Payroll owner | [Pay groups configuration](../configuration/pay-groups-configuration.md) | Population and frequency are complete and do not create duplicate or missing payroll assignment. |
| `CFG-04` | Payroll periods, processing dates, payment dates, adjustments, and calendar approval | Payroll operations owner | [Payroll calendars](../configuration/payroll-calendars.md) | Periods are sequential and approved date exceptions are explained. |
| `CFG-05` | Tax authority, jurisdiction, wage basis, effective date, expected result source, and qualified approval | Tax/compliance owner | [Tax rules configuration](../configuration/tax-rules-configuration.md) | Evidence does not present fictional assumptions as tax advice or approved production treatment. |
| `CFG-06` | Configuration-review evidence and comparison to the approved design | Independent reviewer | [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md) | Reviewer confirms code, scope, effective date, eligibility, calculation, dependencies, and unresolved assumptions. |
| `TST-01` | Approved test scope, responsibilities, environment, entry/exit criteria, severity, and evidence rules | Test lead | [Test plan](../validation-testing/test-plan.md) | Plan covers every affected configuration and control area. |
| `TST-02` | Test IDs, prerequisites, steps, expected results, actual results, statuses, evidence, and defects | Test lead | [Test cases](../validation-testing/test-cases.xlsx) | Required positive, negative, boundary, and regression tests are traceable to the change. |
| `TST-03` | Validation checklist completion and exceptions | Test lead | [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md) | Unchecked mandatory items have an approved disposition. |
| `TST-04` | Defect severity, root cause, owner, corrective action, target date, retest result, and closure | Defect owner | [Defect tracker](../validation-testing/defect-tracking.xlsx) | Closed defects have correction and retest evidence; open high-risk defects block the applicable gate. |
| `TST-05` | Independent expected result or approved calculation basis | Payroll, tax, benefits, finance, or business owner | [Test plan](../validation-testing/test-plan.md) | Expected result is not derived only from the system being tested. |
| `TST-06` | Sanitized evidence reference for inputs, results, reports, integrations, audit output, and reconciliation | Test executor | [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md) | Evidence identifies the test and execution without exposing real worker data. |
| `SEC-01` | Approved access request with person, role, environment, scope, start/end date, and business need | Manager and role owner | [Access-control guidelines](../security/access-control-guidelines.md) | Provisioned access matches the approved request and least-privilege requirement. |
| `SEC-02` | Proposed role responsibilities, permissions, access levels, and approval boundaries | Security owner | [Role-permission matrix](../security/role-permission-matrix.xlsx) | Role is explicitly proposed unless validated against an authorized tenant. |
| `SEC-03` | Segregation-of-duties assessment and conflict disposition | Security and payroll owners | [Segregation of duties](../security/segregation-of-duties.md) | Requester, configurator, implementer, approver, and verifier are separated where practical. |
| `SEC-04` | Temporary or emergency access approval, expiry, use log, and post-use review | Security owner | [Access-control guidelines](../security/access-control-guidelines.md) | Privileged access is time limited, attributable, reviewed, and removed. |
| `SEC-05` | Periodic access review and recertification evidence | Role and process owners | [Security roles and access](../docs/security-roles-and-access.md) | Reviewer confirms continued need, scope, conflicts, and removal actions. |
| `RUN-01` | Authorized implementer, approved window, prerequisites, steps, communications, and actual timestamp | Payroll implementation owner | [Change request template](../change-management/change-request-template.md) | Implementation did not begin before approvals, evidence, access, and timing gates were complete. |
| `RUN-02` | Rollback triggers, decision authority, recovery steps, recovery evidence, and post-change verification | Payroll owner and change approver | [Rollback procedure](../change-management/rollback-procedure.md) | Plan is executable within the payroll cutoff and has an accountable decision owner. |
| `RUN-03` | Implementation result, deviations, configuration reference, and audit log | Authorized implementer | [Change log](../change-management/change-log.xlsx) | Log record is attributable, current, and linked to the approved request and evidence. |
| `VER-01` | Independent verification of configuration, effective date, population, calculation, tax, accounting, reports, integrations, and security | Payroll verifier | [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md) | Verification covers every applicable acceptance criterion and unresolved exception. |
| `CLS-01` | Final status, closure summary, open actions, evidence retention, lessons learned, and payroll-owner approval | Change owner and payroll owner | [Change request template](../change-management/change-request-template.md) | Closure is not recorded while mandatory evidence or unresolved blocking defects remain. |
| `CLS-02` | Final change-log status, test result, verification, closure date, and evidence reference | Payroll change coordinator | [Change log](../change-management/change-log.xlsx) | Change log agrees with the request, test, defect, and closure records. |
| `CLS-03` | End-to-end outcome, simulated evidence, gaps, and improvement actions | Project or governance owner | [Project outcomes](project-outcomes.md) | Simulation is clearly separated from live implementation and open gaps have owners. |
| `RPT-01` | Change volumes, approvals, implementation status, defects, and overdue actions | Project reporting owner | [Change summary report](change-summary-template.xlsx) | Calculated totals reconcile to the filtered source tabs and stated report date. |

## Evidence ownership

| Evidence category | Primary owner | Review responsibility |
| --- | --- | --- |
| Request and business requirement | Change owner and business owner | Payroll change coordinator verifies completeness. |
| Impact and risk | Change owner | Payroll, tax, finance, security, integration, and other control owners review their impacts. |
| Approval decisions | Each authorized approver | Governance owner verifies authority, conditions, and sequencing. |
| Configuration review | Configuration owner | Independent payroll or subject-matter reviewer confirms alignment to the design. |
| Test execution and reconciliation | Test lead and executor | Payroll/test owner verifies completeness, results, and defects. |
| Access and security | Security owner | Payroll/role owners verify need, scope, conflicts, and removal. |
| Implementation and rollback | Authorized implementer and payroll owner | Change approver verifies readiness, result, deviations, and recovery capability. |
| Verification and closure | Independent verifier and change owner | Payroll owner approves closure and evidence retention. |

Evidence ownership means accountability for completeness and protection. It does not authorize an owner to approve their own work where segregation of duties requires an independent decision.

## Retention considerations

- Apply the organization's approved payroll, tax, legal, accounting, security, audit, privacy, and records-retention schedules. This project does not prescribe a legal retention period.
- Retain evidence long enough to support payroll corrections, audits, disputes, statutory reporting, access review, and change reconstruction as required by policy.
- Preserve superseded approvals, configuration comparisons, failed tests, defect history, and rollback evidence when the policy requires a complete audit trail.
- Record the evidence owner, creation date, applicable retention category, disposal date or trigger, legal hold, and approved disposal method in the authoritative evidence index.
- Do not retain duplicate copies longer than needed. Dispose of them securely and document material disposal actions.

## Access restrictions and evidence handling

- Store evidence only in an approved repository with role-based access and attributable activity history.
- Restrict payroll results, tax data, banking information, worker data, security details, and production configuration evidence to authorized users with a business need.
- Separate edit, approval, and audit access where practical. Auditors should normally receive read-only evidence access.
- Do not place credentials, private keys, passwords, access tokens, bank account numbers, tax identifiers, or real employee details in this Git repository.
- Redact screenshots and exports to the minimum data needed for the control. Confirm that filenames, cell comments, hidden sheets, metadata, and attachments do not expose sensitive information.
- Use encrypted transfer and storage where organizational policy requires it. Do not send payroll evidence through unapproved email or messaging channels.
- Review access when a person changes role, leaves the organization, or no longer supports the change.

## Evidence index fields

The authoritative evidence index should include:

- Evidence reference and change ID.
- Artifact type and short description.
- Related test, defect, approval, or implementation step.
- Owner and authorized reviewers.
- Creation or decision timestamp and environment.
- Storage location and access classification.
- Retention category, disposition trigger, and legal-hold indicator.
- Sanitization status and confidentiality restrictions.
- Version or checksum where integrity verification is required.

## Audit conclusion

| Decision | Result |
| --- | --- |
| Missing mandatory evidence | `[IDs or None]` |
| Exceptions and compensating controls | `[References or None]` |
| Open high-risk defects or actions | `[References or None]` |
| Access exceptions | `[References or None]` |
| Retention or disposal actions | `[References or None]` |
| Reviewer conclusion | `[Complete / Complete with Exceptions / Incomplete]` |
| Reviewer and date | `[Authorized role, YYYY-MM-DD]` |
