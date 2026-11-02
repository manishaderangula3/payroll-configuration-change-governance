# Payroll Configuration Change Request

## Template instructions

Use one copy of this template for each proposed payroll configuration change. Replace all bracketed prompts. Do not delete mandatory fields. Use `Not Applicable` only when the requester provides a reason and the payroll change coordinator accepts it.

This template is designed to follow the stages and approval gates in the [business process framework](../docs/business-process-framework.md), [payroll change process](../business-processes/payroll-change-process.md), and [process flow](../business-processes/process-flow.md).

## 1. Request control

| Field | Response |
| --- | --- |
| **Change ID (mandatory)** | `[PCR-YYYY-NNN; assigned by payroll change coordinator]` |
| **Change title (mandatory)** | `[Concise description]` |
| **Status (mandatory)** | `[Draft / Submitted / Under Review / Awaiting Approval / Approved for Build and Test / In Testing / Ready for Implementation Approval / Scheduled / Implemented / Verification in Progress / Closed / Returned Incomplete / Rejected / Deferred / Cancelled / Rolled Back]` |
| **Requester (mandatory)** | `[Name or fictional role]` |
| **Business owner (mandatory)** | `[Accountable owner]` |
| **Change owner (mandatory)** | `[Owner from submission through closure]` |
| **Requested submission date (mandatory)** | `[YYYY-MM-DD]` |
| **Requested effective date (mandatory)** | `[YYYY-MM-DD]` |
| Priority | `[Low / Normal / High / Emergency]` |
| Related change IDs | `[IDs or None]` |

## 2. Business requirement

### Business reason (mandatory)

`[Describe the problem, policy, regulatory need, operational need, or expected benefit. Explain why the change is required.]`

### Expected outcome and acceptance criteria (mandatory)

`[State measurable expected results, affected population, calculation result, reporting outcome, and conditions that must be true for acceptance.]`

### Consequence of not implementing (mandatory)

`[Describe pay, worker, compliance, financial, operational, or timing impact.]`

## 3. Scope and impacted configuration

### Configuration areas (mandatory)

Select all that apply:

- [ ] Earnings
- [ ] Deductions
- [ ] Pay groups
- [ ] Payroll calendars
- [ ] Tax rules
- [ ] Business process or approval routing
- [ ] Security role or permission
- [ ] Integration or interface
- [ ] Accounting or reporting
- [ ] Other: `[describe]`

### Proposed change (mandatory)

`[Describe current documented state, proposed state, calculation method, eligibility, effective dating, and expected behavior. Do not claim a tenant state unless verified evidence exists.]`

### Affected scope (mandatory)

| Field | Response |
| --- | --- |
| Organization or company | `[Fictional or authorized value]` |
| Country and jurisdictions | `[Federal, state, local, or Not Applicable with reason]` |
| Worker population | `[Eligibility criteria and estimated count]` |
| Pay groups | `[Codes or None]` |
| Payroll periods | `[Periods and payment dates]` |
| Earning or deduction codes | `[Codes or None]` |
| Integrations and reports | `[Names or None]` |
| Accounting impact | `[Accounts/processes or None]` |

Configuration references:

- [Earnings configuration](../configuration/earnings-configuration.md)
- [Deductions configuration](../configuration/deductions-configuration.md)
- [Pay groups](../configuration/pay-groups-configuration.md)
- [Payroll calendars](../configuration/payroll-calendars.md)
- [Tax rules](../configuration/tax-rules-configuration.md)

## 4. Risk and impact assessment

| Field | Response |
| --- | --- |
| **Overall risk (mandatory)** | `[Low / Medium / High / Emergency]` |
| **Risk justification (mandatory)** | `[Explain the highest applicable risk]` |
| Payroll result impact | `[None / Low / Medium / High, with explanation]` |
| Tax or compliance impact | `[None / Low / Medium / High, with explanation]` |
| Financial or accounting impact | `[None / Low / Medium / High, with explanation]` |
| Security or segregation-of-duties impact | `[None / Low / Medium / High, with explanation]` |
| Integration or reporting impact | `[None / Low / Medium / High, with explanation]` |
| Retroactive impact | `[Yes / No; periods and population]` |
| Data privacy impact | `[None or approved handling requirement]` |
| Dependencies | `[Other changes, calendars, vendors, decisions, or None]` |
| Assumptions requiring approval | `[List each assumption and approval owner]` |

Complete the [change impact assessment](change-impact-assessment.md) when required by the risk rating or payroll change coordinator.

## 5. Review and approval plan

Identify every required reviewer before requesting approval. Add rows as needed.

| Review area | Required? | Reviewer or role | Decision | Decision date | Conditions or comments |
| --- | --- | --- | --- | --- | --- |
| Business owner | Yes | `[name/role]` | `[Pending]` | `[YYYY-MM-DD]` | `[comments]` |
| Payroll owner | Yes | `[name/role]` | `[Pending]` | `[YYYY-MM-DD]` | `[comments]` |
| Configuration owner | `[Yes/No]` | `[name/role]` | `[Pending/Not Required]` | `[YYYY-MM-DD]` | `[comments]` |
| Tax or compliance | `[Yes/No]` | `[name/role]` | `[Pending/Not Required]` | `[YYYY-MM-DD]` | `[comments]` |
| Legal | `[Yes/No]` | `[name/role]` | `[Pending/Not Required]` | `[YYYY-MM-DD]` | `[comments]` |
| Finance or accounting | `[Yes/No]` | `[name/role]` | `[Pending/Not Required]` | `[YYYY-MM-DD]` | `[comments]` |
| Security | `[Yes/No]` | `[name/role]` | `[Pending/Not Required]` | `[YYYY-MM-DD]` | `[comments]` |
| Integration or reporting | `[Yes/No]` | `[name/role]` | `[Pending/Not Required]` | `[YYYY-MM-DD]` | `[comments]` |
| Test owner | Yes | `[name/role]` | `[Pending]` | `[YYYY-MM-DD]` | `[comments]` |
| Change approver | Yes | `[name/role]` | `[Pending]` | `[YYYY-MM-DD]` | `[comments]` |

Allowed decisions are `Approved`, `Approved with Conditions`, `Rejected`, `Deferred`, `Pending`, and `Not Required`. A `Not Required` decision must include a justification.

## 6. Testing plan and results

| Field | Response |
| --- | --- |
| **Test owner (mandatory)** | `[Name or role]` |
| **Test environment (mandatory before testing)** | `[Authorized non-production environment]` |
| **Test plan reference (mandatory)** | `[Path, link, or test IDs]` |
| **Acceptance criteria (mandatory)** | `[Criteria from Section 2]` |
| Required scenarios | `[Positive, negative, boundary, retro, reversal, security, integration, regression, and other applicable tests]` |
| Fictional test population | `[Worker IDs or personas; no real data]` |
| Test result | `[Not Started / In Progress / Passed / Failed / Passed with Accepted Risk]` |
| Defect references | `[IDs or None]` |
| Evidence reference | `[Sanitized evidence location]` |
| Test sign-off | `[Name/role and YYYY-MM-DD]` |

Testing must follow the [test plan](../validation-testing/test-plan.md) and [payroll validation checklist](../validation-testing/payroll-validation-checklist.md).

## 7. Implementation and rollback

| Field | Response |
| --- | --- |
| **Authorized implementer (mandatory before scheduling)** | `[Name or role]` |
| **Target environment (mandatory)** | `[Environment]` |
| **Planned implementation date and window (mandatory)** | `[YYYY-MM-DD and time window]` |
| **Implementation steps (mandatory)** | `[Numbered steps or approved procedure reference]` |
| Preconditions | `[Approvals, backup, access, calendar cutoff, communications, and other prerequisites]` |
| Communication plan | `[Audience, owner, timing, and method]` |
| **Rollback or correction plan (mandatory)** | `[Trigger, owner, steps, time limit, and validation method]` |
| Implementation status | `[Not Scheduled / Scheduled / In Progress / Implemented / Failed / Rolled Back]` |
| Actual implementation timestamp | `[YYYY-MM-DD HH:MM timezone]` |
| Implementation result and deviations | `[Result, deviations, and evidence reference]` |

Use the [rollback procedure](rollback-procedure.md) for detailed planning and execution.

## 8. Post-implementation verification

| Field | Response |
| --- | --- |
| **Verifier (mandatory; independent where practical)** | `[Name or role]` |
| **Verification date (mandatory)** | `[YYYY-MM-DD]` |
| Configuration and effective date verified | `[Yes/No with evidence]` |
| Payroll result validated | `[Yes/No/Not Applicable with evidence]` |
| Gross-to-net and tax reconciled | `[Yes/No/Not Applicable with evidence]` |
| Accounting and reporting reconciled | `[Yes/No/Not Applicable with evidence]` |
| Integrations verified | `[Yes/No/Not Applicable with evidence]` |
| Security verified | `[Yes/No/Not Applicable with evidence]` |
| Exceptions | `[Issue IDs or None]` |
| Verification outcome | `[Passed / Failed / Correction Required / Rollback Required]` |

## 9. Closure

| Field | Response |
| --- | --- |
| **Final status (mandatory)** | `[Closed / Rolled Back / Cancelled / Rejected]` |
| **Closure summary (mandatory)** | `[Outcome and business confirmation]` |
| Open follow-up actions | `[Owner, action, due date, or None]` |
| Change log updated | `[Yes/No and reference]` |
| Evidence retained and sanitized | `[Yes/No and location]` |
| **Payroll owner closure approval (mandatory)** | `[Name/role, decision, and YYYY-MM-DD]` |
| Lessons learned | `[Optional concise notes]` |

## Mandatory-field rules

The following are mandatory before submission:

- Change ID placeholder or assigned ID, title, requester, business owner, change owner, submission date, requested effective date, and status.
- Business reason, expected outcome, acceptance criteria, and consequence of not implementing.
- Impacted configuration, proposed change, affected scope, overall risk, and risk justification.
- Required reviewers and approval route.
- Test owner and initial testing approach.
- Implementation owner or role and initial rollback or correction approach.

Additional fields become mandatory at their control gate. Test evidence is mandatory before implementation approval. Implementation evidence and verification results are mandatory before closure.

## Handling incomplete requests

1. The payroll change coordinator performs a completeness check before impact review.
2. Missing, unclear, contradictory, or unsupported mandatory information results in status `Returned Incomplete`.
3. The request does not receive an implementation date, configuration work, or approval routing while incomplete.
4. The coordinator records each missing item, the responsible owner, and a requested resubmission date.
5. The requester corrects the same request. A new change ID is not created unless the scope becomes a different change.
6. On resubmission, the coordinator repeats the completeness check and records the new submission date.
7. An urgent request with incomplete information follows the documented emergency-exception process and requires explicit approval and compensating controls.

## Approval alignment

This template separates:

- Completeness acceptance at submission.
- Approval to build and test after impact review.
- Test sign-off after acceptance criteria are met.
- Final implementation approval after readiness and rollback review.
- Closure approval after verification and reconciliation.

A material change to scope, effective date, population, calculation, tax treatment, risk, implementation plan, or rollback plan returns the request to the appropriate earlier review and approval gate.
