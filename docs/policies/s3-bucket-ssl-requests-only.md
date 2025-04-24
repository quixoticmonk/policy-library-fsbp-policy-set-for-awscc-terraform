# S3.5 — S3 buckets should require requests to use Secure Socket Layer

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_s3_bucket, awscc_s3_bucket_policy
* **Policy Enforcement:** This policy will check if S3 buckets require requests to use SSL.

## Description

This policy ensures that Amazon S3 buckets require requests to use Secure Socket Layer (SSL). Enforcing SSL-only access to your S3 buckets helps protect data in transit by encrypting the connection between the client and the S3 bucket. This is achieved by attaching a bucket policy that denies any requests that do not use SSL/TLS.

## Policy Result (Pass)

```
trace: s3-bucket-ssl-requests-only.sentinel:79:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
logs:
  S3 buckets without SSL-only policy:
    * awscc_s3_bucket.bucket1
    * awscc_s3_bucket.bucket2
trace: s3-bucket-ssl-requests-only.sentinel:79:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, create an S3 bucket policy that denies all HTTP requests:

```hcl
resource "awscc_s3_bucket" "example" {
  bucket = "my-bucket"
}

resource "awscc_s3_bucket_policy" "example" {
  bucket = awscc_s3_bucket.example.bucket
  policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "DenyNonSSLRequests"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          "arn:aws:s3:::${awscc_s3_bucket.example.bucket}",
          "arn:aws:s3:::${awscc_s3_bucket.example.bucket}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}
```

## References

- [AWS Foundational Security Best Practices - S3.5](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-s3-5)
- [Amazon S3 Security Best Practices](https://docs.aws.amazon.com/AmazonS3/latest/userguide/security-best-practices.html)
- [Requiring HTTPS for communication between S3 and your clients](https://aws.amazon.com/premiumsupport/knowledge-center/s3-bucket-policy-for-config-rule/)
