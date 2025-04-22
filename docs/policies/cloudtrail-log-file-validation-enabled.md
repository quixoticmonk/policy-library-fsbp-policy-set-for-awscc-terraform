# CloudTrail log file validation is enabled

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [CloudTrail.3](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-3)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy cloudtrail-log-file-validation-enabled.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-log-file-validation-enabled.

Found 1 resource violations

→ Module name: root
   ↳ Resource Address: awscc_cloudtrail_trail.example
     | ✗ failed
     | Attribute 'enable_log_file_validation' must be true for 'awscc_cloudtrail_trail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-3 for more details.
```

## Remediation
To remediate this issue, ensure that log file validation is enabled for CloudTrail trails:

```hcl
resource "awscc_cloudtrail_trail" "example" {
  name = "example-trail"
  s3_bucket_name = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  # Enable log file validation
  enable_log_file_validation = true
}
```

## Resources
- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [CloudTrail Log File Validation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-intro.html)
- [AWS Foundational Security Best Practices - CloudTrail.3](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-3)
