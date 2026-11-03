# Payroll Access-Control Guidelines

## Purpose and status

These guidelines define proposed access controls for the fictional Northstar Services Group payroll governance model. They are not a verified representation of Workday security.

## Core principles

1. **Least privilege:** Grant the minimum access required for the approved responsibility.
2. **Need to know:** Restrict payroll, tax, bank, worker, and security data to authorized users.
3. **Segregation of duties:** Separate configuration, security administration, approval, testing, implementation, and verification where practical.
4. **Named accountability:** Use attributable user accounts. Shared privileged accounts are prohibited unless a controlled technical design requires them.
5. **Environment separation:** Production access requires separate approval from non-production access.
6. **Time limitation:** Temporary and emergency access must expire automatically or have a documented removal date.
7. **Evidence:** Retain the request, approval, provisioner, scope, date, verification, review, and removal record.

## Access request requirements

Every access request should include:

- Requester, worker, manager, and role owner.
- Business reason and specific responsibilities.
- Proposed role, environment, organization, company, and population scope.
- Requested start date, end date, and whether access is temporary.
- Privileged capabilities and known segregation-of-duties conflicts.
- Data sensitivity and required training.
- Manager, role owner, data/process owner, and security approvals as applicable.

Incomplete requests are returned without provisioning.

## Access levels

| Level | Meaning | Example boundary |
| --- | --- | --- |
| None | No access | No payroll data or function available |
| Read | View approved data or evidence | Cannot create, update, approve, or execute |
| Propose | Prepare requests or designs | Cannot activate or approve configuration |
| Maintain | Create or update authorized configuration | Cannot self-approve or grant own access |
| Execute | Run authorized tests, processes, or implementation steps | Limited to approved scope and window |
| Approve | Record an authorized decision | Does not automatically grant configuration or security-maintenance access |
| Administer | Provision approved access or manage technical security | Subject to enhanced logging and independent approval |

## Provisioning and verification

- Security provisions only the approved role and scope.
- The recipient and manager verify access after provisioning.
- Excess or incorrect access is removed immediately and documented.
- Privileged access is logged and reviewed by an independent owner.
- Production access is not copied automatically from non-production access.

## Review and recertification

| Access type | Proposed review frequency | Reviewer |
| --- | --- | --- |
| Privileged payroll or security administration | Quarterly | Role owner, payroll owner, and security owner |
| Payroll configuration and implementation | Quarterly | Payroll owner and security owner |
| Approval roles | Semiannual | Process owner and role owner |
| Read-only operational or audit access | Semiannual | Manager and data/process owner |
| Temporary or emergency access | At expiry and after each use | Request approver and security owner |

Each review must confirm the person, role, scope, business need, manager, last-use evidence where available, conflicts, and required removal or modification. Unconfirmed access is suspended or removed under the approved policy.

## Joiner, mover, leaver controls

- Provision new access only after approved onboarding and required training.
- Reassess access before or immediately after a role, manager, company, location, or responsibility change.
- Remove access promptly at termination or contract end.
- Do not rely only on periodic review to remove known obsolete access.

## Emergency access

Emergency access requires a change or incident reference, reason, scope, approver, start and end time, enhanced logging, and post-use review. It must not become permanent through repeated extensions.

## Related documents

- [Security roles and access](../docs/security-roles-and-access.md)
- [Role-permission matrix](role-permission-matrix.xlsx)
- [Segregation of duties](segregation-of-duties.md)
- [Change request template](../change-management/change-request-template.md)
