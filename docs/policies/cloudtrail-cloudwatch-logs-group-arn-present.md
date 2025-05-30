# CloudTrail trails have CloudWatch logs enabled

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [CloudTrail.4](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-4)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy cloudtrail-cloudwatch-logs-group-arn-present.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy cloudtrail-cloudwatch-logs-group-arn-present.

Found 1 resource violations

→ Module name: root
   ↳ Resource Address: awscc_cloudtrail_trail.example
     | ✗ failed
     | Attribute 'cloud_watch_logs_group_arn' must be present for 'awscc_cloudtrail_trail' resources. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-4 for more details.
```

## Remediation
To remediate this issue, ensure that CloudWatch logs are enabled for CloudTrail trails:

```hcl
resource "awscc_cloudwatch_log_group" "cloudtrail_logs" {
  log_group_name = "CloudTrail/logs"
  retention_in_days = 90
}

resource "awscc_iam_role" "cloudtrail_cloudwatch_role" {
  assume_role_policy_document = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "cloudtrail.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
  
  managed_policy_arns = ["arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"]
}

resource "awscc_cloudtrail_trail" "example" {
  name = "example-trail"
  s3_bucket_name = awscc_s3_bucket.cloudtrail_bucket.bucket
  
  # Enable CloudWatch logs
  cloud_watch_logs_group_arn = awscc_cloudwatch_log_group.cloudtrail_logs.arn
  cloud_watch_logs_role_arn = awscc_iam_role.cloudtrail_cloudwatch_role.arn
}
```

## Resources
- [AWS CloudTrail Documentation](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [CloudTrail Integration with CloudWatch Logs](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/send-cloudtrail-events-to-cloudwatch-logs.html)
- [AWS Foundational Security Best Practices - CloudTrail.4](https://docs.aws.amazon.com/securityhub/latest/userguide/cloudtrail-controls.html#cloudtrail-4)
