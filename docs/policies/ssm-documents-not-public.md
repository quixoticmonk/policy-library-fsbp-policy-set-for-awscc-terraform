# SSM.4: SSM documents should not be public

## Description
This policy ensures that AWS Systems Manager documents are not publicly accessible. Public SSM documents can expose sensitive information and configurations, which could lead to security vulnerabilities.

## Requirements
This policy requires that SSM documents are not shared with "all" accounts, which would make them publicly accessible.

## Resource Types
- awscc_ssm_document

## Policy Result (Pass)
```
PASS - ssm-documents-not-public.sentinel
  PASS - test/ssm-documents-not-public/success.hcl
```

## Policy Result (Fail)
```
FAIL - ssm-documents-not-public.sentinel
  FAIL - test/ssm-documents-not-public/failure.hcl

    logs:
      SSM documents that are publicly accessible:
        * awscc_ssm_document.public_document
    trace:
      ssm-documents-not-public.sentinel:52:1 - Rule "main"
        Description:
          Main rule

        Value:
          false
```

## Remediation
Ensure that SSM documents are not shared with "all" accounts. Instead, specify the exact AWS account IDs that need access to the document:

```hcl
resource "awscc_ssm_document" "example" {
  name           = "example-document"
  document_type  = "Command"
  document_format = "JSON"
  content        = jsonencode({
    schemaVersion = "1.2"
    description   = "Example document"
    parameters    = {}
    runtimeConfig = {
      "aws:runShellScript" = {
        properties = [
          {
            id         = "0.aws:runShellScript"
            runCommand = ["echo Hello World"]
          }
        ]
      }
    }
  })
  
  permissions = {
    account_ids = ["123456789012", "987654321098"]  # Specific account IDs, not "all"
    type        = "Share"
  }
}
```
