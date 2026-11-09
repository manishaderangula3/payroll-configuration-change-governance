# Screenshot Evidence Guidance

The `screenshots/` folder is reserved for approved, sanitized visual evidence that supports a fictional example or an authorized payroll configuration change. No screenshots are currently stored in this repository.

## Allowed content

- Sanitized examples containing fictional records only.
- Cropped configuration or test evidence from an authorized environment when repository storage is explicitly approved.
- Images that show the minimum information needed to support a change, approval, test, defect, verification, or closure decision.

## Prohibited content

Do not store:

- Real employee names, IDs, addresses, bank details, tax identifiers, compensation, deductions, benefits, or payroll results.
- Credentials, private keys, passwords, tokens, tenant URLs, session details, or security-sensitive configuration.
- Unredacted production screenshots or images copied from an unauthorized environment.
- Evidence whose retention, classification, ownership, or access requirements are unknown.

## Naming convention

Use a traceable filename:

```text
PCR-YYYY-NNN_ARTIFACT-ID_short-description_YYYY-MM-DD.png
```

Example:

```text
PCR-2027-001_TC-EAR-001_simulated-result_2026-11-20.png
```

## Review checklist

Before adding an image:

1. Confirm the change ID, test or evidence reference, environment, owner, and capture date.
2. Crop the image to the minimum required area.
3. Redact confidential fields, metadata, browser details, notifications, and unrelated records.
4. Confirm that the filename and visible content use fictional data unless authorized evidence handling permits otherwise.
5. Obtain the required evidence-owner and security or privacy review.
6. Link the image from the relevant request, test, defect, audit, or closure artifact.

Screenshots do not replace structured approvals, test results, defect records, or audit logs. Store authoritative evidence in the organization's approved controlled repository when Git is not an approved evidence location.
