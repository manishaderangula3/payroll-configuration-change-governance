# Security Roles and Access

## Document status

This document describes a **proposed security model** for the fictional Northstar Services Group payroll governance project. The accompanying role-permission matrix has not been validated against an actual Workday tenant, security group, domain, or business-process policy.

## Security objectives

- Limit payroll access to authorized business needs.
- Separate request, configuration, security administration, approval, testing, implementation, verification, and audit responsibilities.
- Protect payroll, tax, banking, worker, and security information.
- Produce attributable evidence for access grants, changes, reviews, and removals.
- Reconfirm access when roles, organizations, employment, or responsibilities change.

## Proposed role model

The [role-permission matrix](../security/role-permission-matrix.xlsx) defines proposed responsibilities, access levels, approval boundaries, conflicting duties, owners, and review frequency for these role families:

- Business requester and business owner.
- Payroll change coordinator and payroll owner.
- Payroll configuration analyst and authorized implementer.
- Payroll tester and post-implementation verifier.
- Tax/compliance, finance, integration, and security reviewers.
- Change approver, security administrator, and internal audit.

## Access lifecycle

1. **Request:** State the role, business reason, scope, environment, effective date, and duration.
2. **Approve:** Obtain the data or process owner and security approval appropriate to the access level.
3. **Provision:** An authorized security administrator grants only approved access.
4. **Verify:** The requester and manager confirm the access is correct and no excess privileges were granted.
5. **Monitor:** Review privileged activity, exceptions, and dormant access.
6. **Recertify:** Role owners and managers periodically confirm continuing need.
7. **Modify or remove:** Update access promptly after transfer, leave, termination, role change, or expiry.

## Approval boundaries

- A payroll configuration analyst may propose and prepare configuration but may not be the sole final approver.
- A security administrator may provision approved access but may not approve their own access request.
- A tester should not approve their own configuration work.
- An implementer should not be the sole post-change verifier.
- Internal audit receives read-only evidence access and does not perform operational changes.
- Emergency access must be time limited, logged, approved, and reviewed after use.

## Related documents

- [Access-control guidelines](../security/access-control-guidelines.md)
- [Segregation of duties](../security/segregation-of-duties.md)
- [Role-permission matrix](../security/role-permission-matrix.xlsx)
- [Approval workflow](../change-management/change-approval-workflow.md)
- [Change request template](../change-management/change-request-template.md)
