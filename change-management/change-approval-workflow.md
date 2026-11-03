# Payroll Change Approval Workflow

## Purpose and status

This document defines proposed approval stages, authorized roles, decision rules, exceptions, and escalation paths for the fictional Northstar Services Group payroll change process. It is not an actual Workday business-process configuration.

The [approval matrix](../business-processes/approval-matrix.xlsx) provides the tabular role-by-stage view. This document provides the governance rules behind that matrix.

## Approval stages

| Stage | Decision owner | Required evidence | Allowed outcome |
| --- | --- | --- | --- |
| 1. Completeness acceptance | Payroll change coordinator | Mandatory change-request fields and unique change ID | Accept for review or return incomplete |
| 2. Impact and risk approval | Payroll owner with required subject-matter owners | Completed impact assessment, risk, dependencies, required approvers, acceptance criteria, and rollback owner | Proceed, clarify, defer, or reject |
| 3. Approval to build and test | Business owner and payroll owner; control owners as risk requires | Approved requirement, proposed design, affected population, test approach, and access plan | Approve, approve with conditions, defer, or reject |
| 4. Test sign-off | Test owner and payroll owner | Approved test cases, expected/actual results, defect disposition, regression evidence, and residual risk | Pass, pass with authorized risk, fail, or return for remediation |
| 5. Final implementation approval | Designated change approver and payroll owner | Successful testing, completed conditions, implementation plan, rollback plan, communications, schedule, and authorized implementer | Approve, defer, reject, or return for remediation |
| 6. Verification acceptance | Payroll verifier and payroll owner | Post-change validation, reconciliation, exception resolution, and evidence | Accept, correct, contain, or roll back |
| 7. Closure approval | Change owner and payroll owner | Final status, evidence links, change-log update, open actions, and lessons learned | Close, close as rolled back, cancel, or retain open |

## Authorized approvers

- **Business owner:** approves the business requirement, priority, affected population, and acceptance criteria.
- **Payroll owner:** approves payroll design, operational timing, testing sufficiency, implementation readiness, verification, and closure.
- **Tax/compliance or legal owner:** approves interpretations and risks within their authority.
- **Finance owner:** approves funding, costing, accounting, and reconciliation impacts.
- **Security owner:** approves privileged access, role changes, and segregation-of-duties exceptions.
- **Integration or reporting owner:** approves affected interfaces, schedules, monitoring, and reporting controls.
- **Test owner:** signs off independently on test execution and evidence where practical.
- **Change approver:** provides the final implementation decision for the applicable risk level.

Approval authority must be assigned by role and organizational policy. Job title alone does not prove authority.

## Decision rules

- Approval must be explicit, attributable, dated, and linked to the change ID.
- `Approved with Conditions` must list each condition, owner, due date, and the gate where it must be complete.
- `Not Required` must include a justification accepted by the payroll change coordinator or governance owner.
- The requester, configurator, implementer, and verifier may not provide the sole approval for their own work.
- Material changes to scope, population, effective date, calculation, tax treatment, risk, testing, implementation, or rollback return to the appropriate earlier stage.
- Missing approval blocks the next control gate.

## Exception handling

An exception record must include:

- Change ID and approval stage.
- Control or approval being changed.
- Business reason, risk, duration, and affected scope.
- Compensating controls.
- Exception approver and expiry date.
- Follow-up owner and retrospective review date.

Emergency changes still require an authorized payroll decision, focused validation, post-change verification, and retrospective approval review. Emergency status must not be used to bypass avoidable planning.

## Escalation paths

| Condition | Primary escalation | Additional escalation |
| --- | --- | --- |
| Incomplete or conflicting request | Change owner and business owner | Payroll owner if unresolved by requested date |
| Missing subject-matter decision | Relevant control owner | Payroll owner and governance owner |
| Failed test or critical defect | Test owner and configuration owner | Payroll owner, business owner, and change approver |
| Approval delay threatens payroll cutoff | Payroll change coordinator | Payroll owner and business owner; defer unless emergency authority is granted |
| Unexpected payroll result | Payroll owner | Finance/treasury, tax/legal/compliance, security, integration, and incident leadership as applicable |
| Unauthorized access or SoD conflict | Security owner and payroll owner | Information-security leadership and internal audit as required |
| Rollback decision required | Payroll owner and change approver | Business owner and affected control owners |

## Alignment with project artifacts

- The [change request template](change-request-template.md) captures stage owners, decisions, conditions, dates, testing, implementation, verification, and closure.
- The [impact assessment](change-impact-assessment.md) determines risk and required control-owner approvals.
- The [test plan](../validation-testing/test-plan.md) supplies the evidence for test sign-off and implementation approval.
- The [rollback procedure](rollback-procedure.md) defines recovery authority and verification when implementation fails.
- The [change log](change-log.xlsx) records lifecycle status, approvals, testing, implementation, verification, and closure.

## Controlled documentation in Confluence

Confluence could serve as the controlled documentation layer when the organization formally approves it for that purpose. A proposed design would:

1. Use a restricted payroll-governance space with role-based view and edit permissions.
2. Create templates for change requests, impact assessments, meeting decisions, test summaries, and closure records.
3. Assign a page owner, change ID, status, effective date, and review date through page properties or structured metadata.
4. Use page history to retain revisions, authors, timestamps, and comparisons.
5. Use approval workflow functionality or an approved add-on to record stage decisions. Page comments alone should not replace formal approval evidence unless policy permits it.
6. Link Confluence pages to the Git repository, workbook records, test evidence, and authorized system-of-record change ticket without copying sensitive payroll data.
7. Restrict attachments, sanitize screenshots, and apply the approved retention policy.
8. Review permissions, archived pages, and stale drafts on a defined schedule.

Confluence revision history records documentation changes. It does not prove that a Workday configuration was implemented or that payroll results were validated. The organization should designate the authoritative system for approvals and operational evidence.

## Related documents

- [Business process framework](../docs/business-process-framework.md)
- [Payroll change process](../business-processes/payroll-change-process.md)
- [Approval matrix](../business-processes/approval-matrix.xlsx)
- [Role-permission matrix](../security/role-permission-matrix.xlsx)
- [Segregation of duties](../security/segregation-of-duties.md)
