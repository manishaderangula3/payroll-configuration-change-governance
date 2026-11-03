# Segregation of Duties

## Purpose and status

This document defines proposed segregation-of-duties controls for the fictional Northstar Services Group payroll change process. Tenant-specific conflicts must be validated against actual Workday security before use.

## Control objective

No individual should control a high-risk payroll change from request through approval, implementation, verification, and closure without independent oversight.

## Incompatible or restricted duty combinations

| Duty 1 | Duty 2 | Risk | Proposed control |
| --- | --- | --- | --- |
| Request own access | Approve or provision that access | Unauthorized privilege | Independent manager/owner approval and separate security administrator |
| Configure payroll rule | Sole final implementation approval | Unreviewed pay change | Independent payroll or change approver |
| Configure payroll rule | Sole test execution and sign-off | Defect may not be detected | Independent tester or secondary reviewer |
| Implement change | Sole post-change verification | Incorrect implementation may be accepted | Independent verifier where practical |
| Maintain security role | Approve own privileged role | Excess access | Independent security owner and process owner approval |
| Create payment or settlement input | Sole release approval | Unauthorized or incorrect payment | Dual control and reconciliation |
| Maintain tax logic | Sole tax interpretation approval | Incorrect regulatory treatment | Qualified tax/compliance approval |
| Close change | Own unresolved critical defect | Premature closure | Payroll owner and change approver closure review |
| Perform operational change | Audit the same change as independent assurance | Loss of audit independence | Separate internal audit role |

## Preventive controls

- Use separate role assignments for configuration, approval, testing, implementation, verification, security administration, and audit.
- Route approvals to named authorized roles rather than the requester.
- Prevent self-approval where the platform supports it.
- Time-limit elevated access and restrict it to the approved environment and population.
- Require two-person control for sensitive payment, settlement, or privileged security activity.

## Detective controls

- Review privileged activity logs and configuration changes.
- Reconcile implemented changes to approved change IDs.
- Report self-approval, same-user build/test/approve patterns, and emergency-access use.
- Recertify access according to the [access-control guidelines](access-control-guidelines.md).
- Investigate dormant, duplicate, shared, or excessive access.

## Exception handling

When staffing makes full separation impractical:

1. Document the conflict, duration, scope, and business reason.
2. Obtain approval from the payroll owner and security owner before access or action.
3. Apply a compensating control such as independent evidence review, paired execution, enhanced logging, or next-day reconciliation.
4. Set an expiry date and named remediation owner.
5. Review the exception after use and during access recertification.

An exception does not permit self-approval of privileged access or concealment of the conflict.

## Review expectations

The payroll and security owners review SoD conflicts quarterly and after material role, process, or organizational changes. Critical conflicts are removed or mitigated before production access continues.

## Related documents

- [Role-permission matrix](role-permission-matrix.xlsx)
- [Access-control guidelines](access-control-guidelines.md)
- [Security roles and access](../docs/security-roles-and-access.md)
- [Approval workflow](../change-management/change-approval-workflow.md)
