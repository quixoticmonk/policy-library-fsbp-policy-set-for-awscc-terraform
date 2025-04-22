# Secrets Manager secrets are rotated within 90 days

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [SecretsManager.4](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-secretsmanager-4)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy secretsmanager-rotation-within-days.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy secretsmanager-rotation-within-days.

Found 2 resource violations

→ Module name: root
   ↳ Resource Address: awscc_secretsmanager_secret.secret_without_rotation
     | ✗ failed
     | Secrets Manager secrets should be rotated within 90 days. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-secretsmanager-4 for more details.
   ↳ Resource Address: awscc_secretsmanager_secret.secret_with_rotation_too_long
     | ✗ failed
     | Secrets Manager secrets should be rotated within 90 days. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-secretsmanager-4 for more details.
```

## Remediation
To remediate this issue, ensure that Secrets Manager secrets are configured to rotate within 90 days:

```hcl
resource "awscc_lambda_function" "rotation_lambda" {
  function_name = "secrets-rotation-lambda"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = awscc_iam_role.lambda_role.arn
  code {
    s3_bucket = "my-lambda-code-bucket"
    s3_key    = "rotation-function.zip"
  }
}

resource "awscc_secretsmanager_secret" "example" {
  name = "example-secret"
  
  # Enable rotation with appropriate rotation period
  rotation_enabled = true
  rotation_lambda_arn = awscc_lambda_function.rotation_lambda.arn
  rotation_rules {
    automatically_after_days = 30  # Must be 90 days or less
  }
}
```

## Resources
- [AWS Secrets Manager Documentation](https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html)
- [Rotating AWS Secrets Manager Secrets](https://docs.aws.amazon.com/secretsmanager/latest/userguide/rotating-secrets.html)
- [AWS Foundational Security Best Practices - SecretsManager.4](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-secretsmanager-4)
