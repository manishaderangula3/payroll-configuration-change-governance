# Payroll Configuration Change Process Flow

This Mermaid diagram represents the proposed workflow defined in the [business process framework](../docs/business-process-framework.md) and [payroll change process](payroll-change-process.md). It does not represent an implemented Workday business process.

```mermaid
flowchart TD
    A([Business need identified]) --> B[Create draft change request]
    B --> C{Mandatory fields complete?}
    C -- No --> D[Return request as incomplete]
    D --> B
    C -- Yes --> E[Assign change ID and submit]
    E --> F[Perform impact and risk review]
    F --> G{Scope and reviewers confirmed?}
    G -- No --> H[Request clarification or defer]
    H --> F
    G -- Yes --> I[Obtain approval to build and test]
    I --> J{Pre-test approvals complete?}
    J -- Rejected --> K([Reject or cancel request])
    J -- Deferred --> L([Defer and record reason])
    J -- No --> I
    J -- Yes --> M[Prepare proposed configuration design]
    M --> N[Execute approved test plan]
    N --> O{Tests and acceptance criteria passed?}
    O -- No --> P[Log defect and revise design]
    P --> M
    O -- Yes --> Q[Prepare implementation and rollback package]
    Q --> R[Obtain final implementation approval]
    R --> S{Final approval granted?}
    S -- No --> T[Return for remediation or cancel]
    T --> Q
    S -- Yes --> U[Implement in approved window]
    U --> V[Perform post-change verification and reconciliation]
    V --> W{Verification successful?}
    W -- No --> X[Contain issue and assess rollback]
    X --> Y{Rollback required?}
    Y -- Yes --> Z[Execute approved rollback]
    Z --> AA[Verify rollback and record outcome]
    AA --> AB[Close as rolled back]
    Y -- No --> AC[Correct issue and retest]
    AC --> V
    W -- Yes --> AD[Obtain closure approval]
    AD --> AE[Update change log and retain evidence]
    AE --> AF([Close change])
```

## Gate interpretation

| Decision | Required evidence |
| --- | --- |
| Mandatory fields complete | Completed request sections, assigned owner, requested date, impacted configuration, initial risk indicators, and acceptance criteria |
| Scope and reviewers confirmed | Impact assessment, risk rating, dependencies, required approvers, and rollback owner |
| Pre-test approvals complete | Explicit business, payroll, and control-owner decisions required by the risk rating |
| Tests passed | Approved test cases, expected and actual results, defect disposition, and test-owner sign-off |
| Final approval granted | Completed implementation plan, rollback plan, communication plan, successful test evidence, and authorized implementer |
| Verification successful | Post-change validation, reconciliation, exception resolution, and verifier sign-off |

## Related documents

- [Change request template](../change-management/change-request-template.md)
- [Change approval workflow](../change-management/change-approval-workflow.md)
- [Change governance procedure](../docs/change-governance-procedure.md)
- [Change impact assessment](../change-management/change-impact-assessment.md)
- [Rollback procedure](../change-management/rollback-procedure.md)
- [Test plan](../validation-testing/test-plan.md)
