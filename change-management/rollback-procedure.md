# Payroll Configuration Rollback Procedure

## Purpose and status

This procedure defines how Northstar Services Group would contain, reverse, correct, and verify a failed payroll configuration change. It is a proposed governance example. Actual recovery steps must be validated in the authorized tenant and operating environment before implementation.

## Rollback principles

- Protect worker pay and prevent further incorrect processing.
- Preserve evidence before changing the failed state.
- Use the least disruptive safe response: pause, contain, correct, reverse, or restore.
- Require an accountable decision owner and an authorized implementer.
- Reconcile affected results after recovery.
- Do not close the change until the rollback or correction is verified.

## Required rollback plan

Before implementation, the [change request](change-request-template.md) must document:

- Rollback decision owner and alternate.
- Authorized rollback implementer.
- Latest safe decision time.
- Trigger thresholds and affected population.
- Configuration, data, integration, and communication recovery steps.
- Evidence or baseline required to restore the prior approved state.
- Expected recovery time and payroll-calendar constraints.
- Validation and reconciliation steps after recovery.
- Conditions where rollback is unsafe and a forward correction is required.

## Rollback triggers

Initiate an immediate assessment when any of the following occurs:

- A critical test or post-change acceptance criterion fails.
- Unexpected gross-to-net, tax, deduction, payment, accounting, or year-to-date results appear.
- The wrong population, effective date, pay period, or jurisdiction is affected.
- A duplicate, missing, or materially incorrect payment is identified.
- A critical integration, settlement, payslip, or regulatory output fails.
- Unauthorized access, segregation-of-duties conflict, or unapproved configuration is detected.
- Implementation differs materially from the approved design.
- Required verification cannot be completed before the safe decision deadline.

## Decision ownership

| Decision | Accountable role | Required consultation |
| --- | --- | --- |
| Pause processing or deployment | Payroll owner or incident commander | Implementer, verifier, and operations |
| Roll back configuration | Designated change approver and payroll owner | Configuration owner, business owner, tester, and affected control owners |
| Use a forward correction | Payroll owner and business owner | Tax, finance, legal, security, or integration owners as applicable |
| Resume payroll processing | Payroll owner | Verifier, finance/treasury, operations, and change approver |
| Notify workers or external parties | Business owner and communications owner | Payroll, legal, compliance, and privacy owners as applicable |

The person who implemented the failed change must not be the sole rollback approver or verifier.

## Recovery procedure

### 1. Detect and contain

1. Stop the affected deployment, calculation, integration, payment, or downstream release when safe and authorized.
2. Record the change ID, detection time, detector, environment, symptoms, affected periods, and estimated population.
3. Preserve logs, screenshots, reports, configuration evidence, and result comparisons in an approved location.
4. Restrict further changes to the authorized incident team.

### 2. Assess

1. Compare actual results with the approved acceptance criteria and baseline.
2. Confirm whether the issue is configuration, data, security, integration, timing, or process related.
3. Determine the affected workers, pay groups, periods, jurisdictions, payments, filings, reports, and downstream systems.
4. Evaluate whether rollback, correction, reprocessing, or manual containment is safest.
5. Escalate based on severity and the next payroll, funding, banking, or filing deadline.

### 3. Decide and authorize

1. The decision owner records `Rollback`, `Forward Correction`, `Hold`, or `No Action` with rationale.
2. Required business, payroll, tax, finance, security, legal, integration, and change-approval roles approve according to the risk.
3. The team confirms the exact recovery steps, authorized implementer, verification owner, and communication plan.

### 4. Execute recovery

1. Restore the prior approved effective-dated configuration or apply the authorized correction.
2. Reverse or recalculate affected payroll results only under an approved plan.
3. Reprocess affected integrations, accounting entries, reports, or payments as authorized.
4. Record every action, timestamp, operator, result, and deviation.
5. Stop and re-escalate if the recovery produces a new unexpected result.

### 5. Verify and reconcile

The verifier must confirm:

- Prior approved configuration or corrective design is active at the correct effective date.
- Affected and unaffected fictional test populations produce expected results.
- Gross-to-net, taxable wages, employer liabilities, deductions, payments, and year-to-date balances reconcile.
- Accounting, integrations, payslips, reporting, and security behave as expected.
- No duplicate, missing, or residual result remains.
- Required communications and operational handoffs are complete.

Use the [test plan](../validation-testing/test-plan.md) and [payroll validation checklist](../validation-testing/payroll-validation-checklist.md) to record evidence.

### 6. Resume and close

1. The payroll owner authorizes resumption only after verification passes or an accepted containment plan is documented.
2. Update the [change log](change-log.xlsx) with the rollback status, dates, owner, verification, and closure outcome.
3. Record defects, root cause, corrective actions, owners, and due dates.
4. Obtain closure approval under the [approval workflow](change-approval-workflow.md).

## Escalation for failed validation or unexpected results

| Severity | Example | Immediate action | Escalation |
| --- | --- | --- | --- |
| Critical | Payment release risk, broad incorrect net pay, unauthorized access, or regulatory filing risk | Stop affected processing when safe; notify payroll owner immediately | Change approver, business owner, finance/treasury, security, tax/legal/compliance, and executive incident leadership as applicable |
| High | Material incorrect calculation or population with time to contain before payment | Hold affected process; begin impact assessment and recovery decision | Payroll owner, business owner, configuration owner, tester, and affected control owners |
| Medium | Limited incorrect result with a controlled workaround | Isolate affected records and document correction | Change owner, payroll operations, tester, and relevant subject-matter owner |
| Low | Documentation or presentation issue with no pay-result impact | Correct under normal change control | Change owner and payroll owner |

No failed validation may be reclassified as passed without documented evidence and approval. Open critical defects block implementation or payroll resumption.

## Related documents

- [Change request template](change-request-template.md)
- [Impact assessment](change-impact-assessment.md)
- [Approval workflow](change-approval-workflow.md)
- [Payroll change process](../business-processes/payroll-change-process.md)
- [Test plan](../validation-testing/test-plan.md)
