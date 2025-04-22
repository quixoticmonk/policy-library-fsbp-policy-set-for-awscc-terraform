# CloudTrail Policies

This directory contains Sentinel policies that enforce best practices for AWS CloudTrail.

## Policies

- **cloudtrail-log-file-validation-enabled.sentinel**: Ensures that CloudTrail log file validation is enabled.
- **cloudtrail-server-side-encryption-enabled.sentinel**: Ensures that CloudTrail has server-side encryption enabled.
- **cloudtrail-cloudwatch-logs-group-arn-present.sentinel**: Ensures that CloudTrail is integrated with CloudWatch Logs.
- **cloudtrail-bucket-access-logging-enabled.sentinel**: Ensures that the S3 bucket used by CloudTrail has access logging enabled.
- **cloudtrail-logs-bucket-not-public.sentinel**: Ensures that the S3 bucket used by CloudTrail is not publicly accessible.

## Testing

Each policy has associated test cases that verify the policy's behavior. The test cases include both success and failure scenarios.

## How to Use

To use these policies, include them in your Sentinel policy set configuration in your Terraform Cloud or Terraform Enterprise workspace.

```hcl
policy "cloudtrail-log-file-validation-enabled" {
  source = "./policies-awscc/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-server-side-encryption-enabled" {
  source = "./policies-awscc/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "./policies-awscc/cloudtrail/cloudtrail-cloudwatch-logs-group-arn-present.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-bucket-access-logging-enabled" {
  source = "./policies-awscc/cloudtrail/cloudtrail-bucket-access-logging-enabled.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "cloudtrail-logs-bucket-not-public" {
  source = "./policies-awscc/cloudtrail/cloudtrail-logs-bucket-not-public.sentinel"
  enforcement_level = "hard-mandatory"
}
```

## Related Documentation

- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/cloudtrail/)
- [CIS AWS Foundations Benchmark](https://www.cisecurity.org/benchmark/amazon_web_services/)
- [AWS Security Hub CloudTrail Controls](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html)
