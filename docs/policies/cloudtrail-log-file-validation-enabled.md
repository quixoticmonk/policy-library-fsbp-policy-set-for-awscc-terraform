# cloudtrail-log-file-validation-enabled

## Policy Description
This policy requires resources of type `awscc_cloudtrail_trail` to have log file validation enabled.

## Policy Result (Pass)
```
PASS - policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel

    logs:
      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy cloudtrail-log-file-validation-enabled.

      ✓ Found 0 resource violations
```

## Policy Result (Fail)
```
FAIL - policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel

    logs:
      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-log-file-validation-enabled.

      Found 1 resource violations

      → Module name: root
         ↳ Resource Address: awscc_cloudtrail_trail.example
           | ✗ failed
           | Attribute 'enable_log_file_validation' must be true for 'awscc_cloudtrail_trail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-3 for more details.
```

## Remediation

### AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practices control [CloudTrail.3](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-3).

### Terraform Resource(s)
- `awscc_cloudtrail_trail`

### Recommended Actions
Ensure that log file validation is enabled for CloudTrail trails:

```hcl
resource "awscc_cloudtrail_trail" "example" {
  name                        = "example-trail"
  s3_bucket_name              = awscc_s3_bucket.cloudtrail_bucket.bucket
  enable_log_file_validation  = true
  # other configuration...
}
```

### Additional Information
Log file validation creates a digitally signed digest file containing a hash of each log that CloudTrail writes to S3. These digest files can be used to determine whether a log file was modified, deleted, or unchanged after CloudTrail delivered the log.

For more information, see:
- [AWS CloudTrail Log File Validation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-intro.html)
- [Validating CloudTrail Log File Integrity](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-log-file-validation-cli.html)
