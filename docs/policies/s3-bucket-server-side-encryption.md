# S3.4 — S3 buckets should have server-side encryption enabled

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_s3_bucket
* **Policy Enforcement:** This policy will check if S3 buckets have server-side encryption enabled.

## Description

This policy ensures that Amazon S3 buckets have server-side encryption enabled. Server-side encryption protects data at rest in Amazon S3 by encrypting each object with a unique key. As an additional safeguard, Amazon S3 encrypts the key itself with a master key that it regularly rotates. Amazon S3 server-side encryption uses one of the strongest block ciphers available, 256-bit Advanced Encryption Standard (AES-256), to encrypt your data.

## Policy Result (Pass)

```
trace: s3-bucket-server-side-encryption.sentinel:49:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
logs:
  S3 buckets without server-side encryption enabled:
    * awscc_s3_bucket.bucket1
    * awscc_s3_bucket.bucket2
trace: s3-bucket-server-side-encryption.sentinel:49:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your S3 bucket configuration to enable server-side encryption:

```hcl
resource "awscc_s3_bucket" "example" {
  bucket = "my-bucket"
  
  bucket_encryption {
    server_side_encryption_configuration {
      server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}
```

Alternatively, you can use AWS KMS for server-side encryption:

```hcl
resource "awscc_s3_bucket" "example" {
  bucket = "my-bucket"
  
  bucket_encryption {
    server_side_encryption_configuration {
      server_side_encryption_by_default {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = "arn:aws:kms:us-east-1:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
      }
    }
  }
}
```

## References

- [AWS Foundational Security Best Practices - S3.4](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-s3-4)
- [Amazon S3 Default Encryption for S3 Buckets](https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucket-encryption.html)
