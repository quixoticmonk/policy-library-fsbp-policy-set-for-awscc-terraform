# CloudTrail trails are encrypted using KMS CMKs

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [CloudTrail.2](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-2)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy cloudtrail-server-side-encryption-enabled.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-server-side-encryption-enabled.

Found 1 resource violations

→ Module name: root
   ↳ Resource Address: awscc_cloudtrail_trail.example
     | ✗ failed
     | Attribute 'kms_key_id' must be present for 'awscc_cloudtrail_trail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-2 for more details.
```

## Remediation
To remediate this issue, ensure that CloudTrail trails are encrypted using KMS CMKs:

```hcl
resource "awscc_kms_key" "cloudtrail_key" {
  description = "KMS key for CloudTrail encryption"
  key_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "Enable IAM User Permissions"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        }
        Action = "kms:*"
        Resource = "*"
      },
      {
        Sid = "Allow CloudTrail to encrypt logs"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = [
          "kms:GenerateDataKey*",
          "kms:Decrypt"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "awscc_cloudtrail_trail" "example" {
  name = "example-trail"
  s3_bucket_name = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  # Enable KMS encryption
  kms_key_id = awscc_kms_key.cloudtrail_key.key_id
}
```

## Resources
- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [Encrypting CloudTrail Log Files with AWS KMS Keys](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/encrypting-cloudtrail-log-files-with-aws-kms.html)
- [AWS Foundational Security Best Practices - CloudTrail.2](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-2)
