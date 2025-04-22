# CloudTrail S3 buckets are not publicly accessible

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [CloudTrail.6](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-6)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy cloudtrail-logs-bucket-not-public.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-logs-bucket-not-public.

Found 1 resource violations

→ Module name: root
   ↳ Resource Address: awscc_cloudtrail_trail.example
     | ✗ failed
     | S3 bucket used to store cloudtrail logs must not be publicly accessible. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-6 for more details.
```

## Remediation
To remediate this issue, ensure that the S3 bucket used for CloudTrail logs is not publicly accessible:

```hcl
resource "awscc_s3_bucket" "cloudtrail_bucket" {
  bucket = "example-cloudtrail-logs"
  # Do not set public ACL
}

resource "awscc_s3_bucket_public_access_block" "cloudtrail_bucket" {
  bucket = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  # Block all public access
  block_public_acls = true
  ignore_public_acls = true
  block_public_policy = true
  restrict_public_buckets = true
}

resource "awscc_s3_bucket_acl" "cloudtrail_bucket" {
  bucket = awscc_s3_bucket.cloudtrail_bucket.bucket
  acl = "private"
}

resource "awscc_cloudtrail_trail" "example" {
  name = "example-trail"
  s3_bucket_name = awscc_s3_bucket.cloudtrail_bucket.bucket
}
```

## Resources
- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
- [AWS Foundational Security Best Practices - CloudTrail.6](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-6)
