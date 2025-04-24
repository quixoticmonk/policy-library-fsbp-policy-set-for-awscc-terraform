# S3.14 — S3 buckets should have versioning enabled

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_s3_bucket
* **Policy Enforcement:** This policy will check if S3 buckets have versioning enabled.

## Description

This policy ensures that Amazon S3 buckets have versioning enabled. S3 bucket versioning is a means of keeping multiple variants of an object in the same bucket. Versioning can be used to preserve, retrieve, and restore every version of every object stored in your Amazon S3 bucket, which allows for easy recovery from both unintended user actions and application failures. Once you enable versioning for a bucket, it cannot be disabled, only suspended.

## Policy Result (Pass)

```
trace: s3-bucket-versioning-enabled.sentinel:53:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
logs:
  S3 buckets without versioning enabled:
    * awscc_s3_bucket.bucket1
    * awscc_s3_bucket.bucket2
    * awscc_s3_bucket.bucket3
trace: s3-bucket-versioning-enabled.sentinel:53:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your S3 bucket configuration to enable versioning:

```hcl
resource "awscc_s3_bucket" "example" {
  bucket = "my-bucket"
  
  versioning {
    status = "Enabled"
  }
}
```

## References

- [AWS Foundational Security Best Practices - S3.14](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-s3-14)
- [Using versioning in S3 buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/Versioning.html)
