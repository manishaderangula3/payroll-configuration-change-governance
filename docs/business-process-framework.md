# Business Process Framework

## Document status

This framework defines a **proposed** payroll configuration change process for the fictional Northstar Services Group (NSG). It does not represent a workflow configured in Workday or another production system.

## Purpose

The framework provides a controlled path for payroll configuration changes from initial request through closure. It is intended to ensure that every change has:

- A documented business reason and accountable owner.
- Clear scope, effective date, dependencies, and affected populations.
- Risk, security, tax, accounting, integration, and compliance review.
- Approval by the appropriate business and control owners.
- Independent test evidence and defined acceptance criteria.
- An authorized implementation and rollback plan.
- Post-implementation verification, reconciliation, and retained evidence.

## Guiding principles

1. **Traceability:** Every artifact must reference one unique change ID.
2. **Effective dating:** The requested effective date must align with an approved payroll period and processing cutoff.
3. **Segregation of duties:** The requester, configurator, tester, and final approver should be separated where practical.
4. **Least privilege:** Only authorized roles may configure, migrate, approve, or verify a change.
5. **Evidence before approval:** Approvers must review documented impact analysis and test results rather than rely on verbal confirmation.
6. **No self-approval:** A person who prepares or implements a change must not provide the sole final approval.
7. **Reversibility:** Every implementation must include a feasible rollback, correction, or containment approach.
8. **Fictional data only:** Repository examples must not contain real employee, payroll, tax, banking, tenant, or credential data.

## Lifecycle and control gates

| Stage | Primary activity | Required owner | Minimum entry criteria | Exit criteria and control gate |
| --- | --- | --- | --- | --- |
| 1. Request submission | Record the business need, scope, owner, requested date, and affected configuration. | Requester or business owner | Identified business need | Mandatory fields complete; unique change ID assigned; status set to `Submitted`. |
| 2. Review and impact assessment | Assess payroll, worker, tax, accounting, security, integration, reporting, calendar, and compliance impacts. | Payroll change coordinator with subject-matter reviewers | Complete request | Scope and risk classified; dependencies and required approvers identified; status set to `Under Review`. |
| 3. Approval to build and test | Authorize design work and testing based on risk and impact. | Business owner, payroll owner, and required control owners | Completed impact assessment | All required pre-test approvals recorded; rejected or deferred requests do not proceed. |
| 4. Build and testing | Prepare the proposed configuration in an authorized non-production environment and execute approved tests. | Authorized configurator and independent tester | Approval to build and test; test plan and acceptance criteria available | Required tests pass; defects resolved or formally accepted; evidence attached; status set to `Ready for Implementation Approval`. |
| 5. Implementation approval and execution | Confirm readiness, schedule, communications, rollback plan, and authorized implementer before promotion. | Change approver and authorized implementer | Successful testing and complete implementation package | Final approval recorded before implementation; implementation result and timestamp documented. |
| 6. Verification and reconciliation | Validate payroll results, security, integrations, accounting, reporting, and affected population after implementation. | Payroll verifier independent of implementation where practical | Implemented change | Acceptance criteria met and reconciliation complete, or rollback/correction initiated. |
| 7. Closure | Confirm evidence, outcomes, unresolved actions, and lessons learned. | Change owner and payroll owner | Successful verification or documented rollback | Closure approval recorded; status set to `Closed`, `Rolled Back`, or `Cancelled`; evidence retained. |

## Status model

Use only the following lifecycle statuses unless the governance owner approves an extension:

`Draft` → `Submitted` → `Under Review` → `Awaiting Approval` → `Approved for Build and Test` → `In Testing` → `Ready for Implementation Approval` → `Scheduled` → `Implemented` → `Verification in Progress` → `Closed`

Alternative terminal or exception statuses are `Returned Incomplete`, `Rejected`, `Deferred`, `Cancelled`, and `Rolled Back`.

## Risk classification

| Risk | Example characteristics | Minimum approval expectation |
| --- | --- | --- |
| Low | Documentation-only or narrowly scoped change with no pay-result impact | Change owner and payroll owner |
| Medium | Limited worker population or configuration change with controlled pay impact | Business owner, payroll owner, configuration owner, and testing owner |
| High | Tax, broad population, pay-group, calendar, security, integration, retroactive, or material financial impact | Business owner, payroll owner, tax/compliance or legal as applicable, finance, security, testing, and designated change approver |
| Emergency | Urgent correction required to prevent or limit payroll harm | Emergency approver and payroll owner before action where feasible, followed by retrospective documentation and review |

Risk classification must reflect the highest applicable impact. A proposed tax, security, pay-group, payroll-calendar, retroactive, or broad-population change should not be treated as low risk.

## Approval rules

- The request identifies required approvers during impact assessment.
- Conditional approvals must record the condition, owner, and due date.
- Approval must be explicit, dated, attributable, and linked to the change ID.
- Approval to build and test is separate from approval to implement.
- A changed design, scope, effective date, affected population, tax treatment, or rollback plan requires re-review and may require renewed approval.
- Missing or expired approval stops progression to the next control gate.

## Roles and responsibilities

| Role | Responsibility |
| --- | --- |
| Requester | Describes the need, expected result, requested date, and business impact. |
| Business owner | Confirms business requirement, priority, population, funding, and acceptance criteria. |
| Payroll change coordinator | Assigns the change ID, checks completeness, coordinates reviews, and maintains status. |
| Payroll configuration analyst | Documents and prepares the proposed design in an authorized environment. |
| Subject-matter reviewer | Reviews tax, benefits, finance, accounting, legal, security, integration, reporting, or compliance impacts. |
| Tester | Executes approved tests and records expected and actual results independently where practical. |
| Change approver | Confirms evidence, risk, timing, approvals, rollback readiness, and implementation authorization. |
| Implementer | Performs the authorized implementation and records the outcome. |
| Verifier | Performs post-change validation and reconciliation. |
| Change owner | Owns the request through closure and ensures unresolved actions are assigned. |

## Evidence and record retention

The change record should link to the request, impact assessment, proposed design, approvals, test plan, test results, defects, implementation evidence, verification results, rollback decision, and closure approval. Evidence must be sanitized before it is stored in this repository.

## Exceptions and emergency changes

An exception must identify the skipped or accelerated control, reason, risk, approving authority, compensating control, and follow-up due date. Emergency status does not eliminate testing, verification, or retrospective review. If payroll impact can be safely contained without immediate configuration, the team should use the standard workflow.

## Related documents

- [Operational payroll change process](../business-processes/payroll-change-process.md)
- [Mermaid process flow](../business-processes/process-flow.md)
- [Change request template](../change-management/change-request-template.md)
- [Change approval workflow](../change-management/change-approval-workflow.md)
- [Change governance procedure](change-governance-procedure.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Rollback procedure](../change-management/rollback-procedure.md)
- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
- [Configuration documentation](../configuration/earnings-configuration.md)

The detailed approval workflow, governance procedure, testing documents, and rollback procedure are maintained as separate artifacts so they can be expanded without changing this lifecycle model.
