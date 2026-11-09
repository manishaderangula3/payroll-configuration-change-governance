# Payroll Configuration Change Governance Procedure

## Status and purpose

This document defines a proposed governance procedure for payroll configuration changes at the fictional Northstar Services Group. It is a documentation framework, not a record of a live Workday tenant, approved organization policy, or completed payroll change.

The procedure controls how a change moves from request through assessment, approval, testing, implementation decision, verification, closure, and audit retention. It applies to proposed earnings, deductions, pay groups, payroll calendars, tax rules, security, integrations, reports, and related payroll processes.

## Governing principles

- Use one `PCR-YYYY-NNN` change ID across the request, impact assessment, approvals, tests, defects, evidence, change log, and closure record.
- Keep proposed configuration separate from tenant-verified configuration.
- Require approval before build, test, implementation, and closure according to risk and affected areas.
- Separate requesting, configuring, approving, implementing, verifying, and auditing duties where practical.
- Use fictional or sanitized data outside an authorized environment.
- Preserve attributable, dated, readable, protected, and traceable evidence.
- Do not implement a change with unresolved blocking defects, missing mandatory approvals, unauthorized access, or an unapproved rollback plan.

## Roles and accountability

| Role | Primary accountability |
| --- | --- |
| Business requester | States the business reason, desired outcome, scope, and requested date. |
| Change coordinator | Assigns the change ID, checks completeness, maintains status, coordinates reviews, and confirms closure evidence. |
| Payroll configurator | Documents and prepares the proposed design within approved access boundaries. |
| Payroll owner | Owns payroll risk, approves key decisions, and accepts residual risk within delegated authority. |
| Tax, compliance, legal, benefits, finance, integration, or security reviewer | Reviews the affected specialty area and records conditions or objections. |
| Test lead | Defines coverage, controls expected results, records evidence, and coordinates defect retesting. |
| Implementer | Performs the authorized implementation within the approved window. |
| Independent verifier | Reviews the post-change result and evidence without relying solely on the implementer. |
| Internal audit or control reviewer | Evaluates evidence completeness, access, traceability, and control operation. |

Detailed proposed permissions and incompatible duties are documented in the [role-permission matrix](../security/role-permission-matrix.xlsx) and [segregation-of-duties guidance](../security/segregation-of-duties.md).

## Procedure

### 1. Submit and register the request

The requester completes the [change request template](../change-management/change-request-template.md). The change coordinator assigns a unique change ID and returns an incomplete request without routing it for approval.

Mandatory information includes the business reason, owner, affected configuration, requested effective date, risk, dependencies, approvals, testing approach, implementation status, and rollback concept.

### 2. Assess impact and risk

Complete the [change impact assessment](../change-management/change-impact-assessment.md). Review payroll results, retroactivity, tax, accounting, reporting, integrations, security, worker communications, calendar timing, downstream processing, and jurisdictional requirements.

Classify risk using the documented criteria. Record assumptions requiring payroll-owner, tax, legal, compliance, or business approval.

### 3. Obtain approval to build and test

Route the request through the [change approval workflow](../change-management/change-approval-workflow.md) and [approval matrix](../business-processes/approval-matrix.xlsx). Approval must be attributable and within the approver's delegated authority.

Conditional approval must state the condition, owner, due date, and evidence needed. A rejection or deferral returns the request to the change coordinator with a recorded reason.

### 4. Prepare the proposed configuration

The configurator prepares the design in the relevant configuration document and records effective dating, eligibility, calculation logic, dependencies, access needs, validation rules, and rollback requirements.

The design remains proposed until an authorized reviewer verifies it in the appropriate environment. Do not describe an unverified setting as actual Workday configuration.

### 5. Test and manage defects

Use the [test plan](../validation-testing/test-plan.md), [test-case workbook](../validation-testing/test-cases.xlsx), and [payroll validation checklist](../validation-testing/payroll-validation-checklist.md). Cover positive, negative, boundary, and regression scenarios for all affected areas.

Record actual results only when execution occurs in an authorized environment. Otherwise use `Simulated` or `Not Executed`. Log issues in the [defect tracker](../validation-testing/defect-tracking.xlsx), assign severity and ownership, retain original evidence, and document retest results.

### 6. Decide whether to implement

The authorized decision group reviews approvals, test evidence, open defects, access, payroll timing, communications, dependencies, and the [rollback procedure](../change-management/rollback-procedure.md).

Do not proceed when a mandatory approval is missing, a blocking defect remains unresolved, access violates segregation of duties, payroll timing is unsafe, or rollback is not viable. Record the decision and any conditions.

### 7. Implement and verify

An authorized implementer performs the approved steps during the approved window. Record the date, environment, implementer, configuration reference, and evidence location.

An independent verifier checks effective dating, calculation behavior, access, downstream results, reports, and audit evidence. Unexpected payroll results follow the escalation and rollback rules.

### 8. Close and retain evidence

The change coordinator updates the [change log](../change-management/change-log.xlsx) and confirms that the request, approvals, design, tests, defects, implementation decision, verification, closure, and evidence references are linked.

Use the [payroll audit checklist](../reports/payroll-audit-checklist.md) before closure. Open actions must have an owner, due date, accepted disposition, and escalation path. Retain evidence under approved records-management, privacy, legal-hold, and access policies.

## Exceptions and escalation

- Emergency changes require an emergency reason, authorized decision owner, minimum viable testing, time-bound access, independent review, and retrospective approval.
- A failed validation, unexpected payroll result, or control breach is escalated to the payroll owner and affected specialists immediately.
- The payroll owner or delegated incident authority decides whether to stop processing, correct forward, reverse the change, or execute rollback.
- A person outside delegated authority cannot approve an exception. Unapproved exceptions remain open and block closure.

## Evidence and reporting

The [change summary report](../reports/change-summary-template.xlsx) provides fictional status metrics and overdue-action reporting. The [project outcomes report](../reports/project-outcomes.md) records measured repository results and project limitations.

Evidence must not contain credentials, private keys, real employee identifiers, bank details, tax identifiers, confidential payroll results, or unredacted production screenshots. Store controlled evidence only in an approved location with access appropriate to its classification.

## Procedure maintenance

Review this proposed procedure when payroll scope, organization roles, legal requirements, systems, or approval boundaries change. Document the owner, review date, approved revision, and effective date in the organization's controlled documentation platform before operational use.
