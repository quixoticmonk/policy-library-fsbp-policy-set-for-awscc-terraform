# cloudtrail-logs-bucket-not-public

## Policy Description
This policy requires that S3 buckets used to store CloudTrail logs are not publicly accessible.

## Policy Requirements
This policy requires that CloudTrail S3 buckets have appropriate access controls to prevent public access.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [CloudTrail.6](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-6).

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
}

resource "awscc_s3_bucket_public_access_block" "cloudtrail_bucket_block" {
  bucket = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  block_public_acls = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}

resource "awscc_s3_bucket_policy" "cloudtrail_bucket_policy" {
  bucket = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid = "AWSCloudTrailAclCheck"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "s3:GetBucketAcl"
        Resource = "arn:aws:s3:::${awscc_s3_bucket.cloudtrail_bucket.bucket}"
      },
      {
        Sid = "AWSCloudTrailWrite"
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "s3:PutObject"
        Resource = "arn:aws:s3:::${awscc_s3_bucket.cloudtrail_bucket.bucket}/AWSLogs/*"
        Condition = {
          StringEquals = {
            "s3:x-amz-acl" = "bucket-owner-full-control"
          }
        }
      }
    ]
  })
}
```

## Resources
- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/userguide/access-control-block-public-access.html)
- [AWS Foundational Security Best Practices - CloudTrail.6](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-6)
