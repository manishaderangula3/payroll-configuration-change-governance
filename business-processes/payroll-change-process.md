# Payroll Configuration Change Process

## Purpose and status

This document converts the [business process framework](../docs/business-process-framework.md) into operational steps for the fictional Northstar Services Group. It is a proposed governance process and not an actual Workday business process.

## Process summary

| Stage | Accountable role | Primary output |
| --- | --- | --- |
| Request submission | Requester and change owner | Complete change request with unique ID |
| Review | Payroll change coordinator | Impact assessment, risk rating, reviewer list, and proposed route |
| Approval | Required business and control owners | Approval to build and test |
| Testing | Configuration analyst and independent tester | Proposed design, test evidence, resolved defects, and readiness recommendation |
| Implementation | Change approver and authorized implementer | Final authorization and recorded implementation result |
| Verification | Payroll verifier | Post-change validation and reconciliation evidence |
| Closure | Change owner and payroll owner | Closure decision, retained evidence, and follow-up actions |

## Detailed procedure

### 1. Submit request

1. The requester creates a record using the [change request template](../change-management/change-request-template.md).
2. The request includes the business reason, affected configuration, requested effective date, owner, expected outcome, risk indicators, testing expectations, and implementation need.
3. The payroll change coordinator assigns a unique ID in the format `PCR-YYYY-NNN`.
4. The coordinator checks all mandatory fields before accepting the request.
5. An incomplete request is marked `Returned Incomplete`, is not scheduled, and is returned with missing items and a resubmission owner.

**Gate 1:** A request cannot enter impact review until all mandatory fields are complete.

### 2. Review and assess impact

1. Payroll confirms the requested outcome and identifies the proposed configuration objects.
2. The coordinator records impacts to earnings, deductions, pay groups, calendars, tax, workers, security, integrations, accounting, reporting, retroactivity, and downstream operations.
3. Subject-matter reviewers document assumptions, dependencies, constraints, and required decisions.
4. Payroll assigns the highest applicable risk rating and identifies required approvers.
5. The change owner defines measurable acceptance criteria and a feasible rollback or correction approach.

Relevant configuration references:

- [Earnings](../configuration/earnings-configuration.md)
- [Deductions](../configuration/deductions-configuration.md)
- [Pay groups](../configuration/pay-groups-configuration.md)
- [Payroll calendars](../configuration/payroll-calendars.md)
- [Tax rules](../configuration/tax-rules-configuration.md)

**Gate 2:** Review is complete only when impacts, risk, approvers, acceptance criteria, and rollback ownership are documented.

### 3. Approve build and testing

1. The business owner confirms the requirement and affected population.
2. Payroll confirms the proposed processing approach and operational timing.
3. Required control owners review their areas. Examples include tax, compliance, legal, finance, security, benefits, integrations, and reporting.
4. Approvers record `Approved`, `Approved with Conditions`, `Rejected`, or `Deferred` with a date and comment.
5. Conditional approvals must be satisfied before the related control gate.

**Gate 3:** Configuration work and formal testing begin only after all required pre-test approvals are recorded.

### 4. Prepare design and test

1. An authorized analyst documents the effective-dated design and prepares it in an authorized non-production environment when one is available.
2. A tester who is independent from the configuration where practical prepares expected results from approved requirements.
3. Testing covers positive, negative, effective-date boundary, calculation, security, integration, accounting, reporting, reversal, regression, and rollback scenarios as applicable.
4. Defects are recorded, prioritized, corrected, and retested.
5. The test owner records whether all acceptance criteria passed and identifies accepted residual risks.

Testing references:

- [Test plan](../validation-testing/test-plan.md)
- [Payroll validation checklist](../validation-testing/payroll-validation-checklist.md)
- [Defect tracker](../validation-testing/defect-tracking.xlsx)

**Gate 4:** The change cannot proceed if a critical defect is open, required evidence is missing, or an acceptance criterion has failed without authorized risk acceptance.

### 5. Approve and implement

1. The change owner assembles the final implementation package.
2. The change approver confirms completed reviews, successful testing, implementation timing, communications, authorized access, and rollback readiness.
3. Final approval is recorded before implementation.
4. The authorized implementer performs only the approved change in the approved window.
5. The implementer records the environment, timestamp, result, deviations, and evidence reference.
6. Any unapproved deviation stops the implementation and triggers escalation or rollback assessment.

**Gate 5:** Implementation requires explicit final approval and an identified verifier who is not the sole implementer where practical.

### 6. Verify and reconcile

1. The verifier confirms the intended configuration and effective date.
2. Payroll validates representative results and the complete affected population where feasible.
3. The team reconciles gross-to-net results, taxable wages, employer liabilities, deductions, accounting, integrations, payslips, and reports as applicable.
4. Security validates access changes when the request affects roles or permissions.
5. Results are compared with the approved acceptance criteria.
6. A failed verification triggers correction, containment, or the [rollback procedure](../change-management/rollback-procedure.md).

**Gate 6:** Closure is not allowed until verification succeeds or the rollback/correction outcome is documented and approved.

### 7. Close change

1. The change owner confirms that required evidence is linked and sanitized.
2. Payroll records the final status: `Closed`, `Rolled Back`, `Cancelled`, or another approved terminal status.
3. Open follow-up actions receive an owner and due date.
4. The payroll owner provides closure approval.
5. The coordinator updates the change log and retains the record under the approved retention policy.

## Control rules

- Do not use email or chat approval alone unless it is captured in the official change record.
- Do not implement a request with missing mandatory fields or approvals.
- Do not reuse a change ID for a different scope.
- Reassess and reapprove material changes to scope, design, effective date, population, risk, tax treatment, or rollback plan.
- Keep proposed documentation distinct from verified tenant evidence.
- Store only fictional or sanitized records in this repository.

## Related documents

- [Business process framework](../docs/business-process-framework.md)
- [Process flow](process-flow.md)
- [Change request template](../change-management/change-request-template.md)
- [Change approval workflow](../change-management/change-approval-workflow.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Rollback procedure](../change-management/rollback-procedure.md)
