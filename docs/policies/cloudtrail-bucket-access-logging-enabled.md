# cloudtrail-bucket-access-logging-enabled

## Policy Description
This policy requires that resources of type `awscc_cloudtrail_trail` have bucket access logging enabled.

## Policy Requirements
This policy requires that CloudTrail S3 buckets have access logging enabled.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [CloudTrail.7](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-7).

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy cloudtrail-bucket-access-logging-enabled.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-bucket-access-logging-enabled.

Found 1 resource violations

→ Module name: root
   ↳ Resource Address: awscc_cloudtrail_trail.example
     | ✗ failed
     | Cloudtrail S3 buckets must have access logging enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-7 for more details.
```

## Remediation
To remediate this issue, ensure that access logging is enabled for the S3 bucket used by CloudTrail:

```hcl
resource "awscc_s3_bucket_logging" "example" {
  bucket = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  logging_config {
    target_bucket = awscc_s3_bucket.log_bucket.bucket
    target_prefix = "cloudtrail-access-logs/"
  }
}
```

## Resources
- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [AWS S3 Bucket Logging](https://docs.aws.amazon.com/AmazonS3/latest/userguide/ServerLogs.html)
- [AWS Foundational Security Best Practices - CloudTrail.7](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-7)
