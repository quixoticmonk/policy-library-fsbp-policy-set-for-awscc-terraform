# CloudWatch Policies for CIS AWS Foundations Benchmark

This directory contains Sentinel policies that enforce the CloudWatch-related controls from the CIS AWS Foundations Benchmark. These policies are designed to work with the AWS Cloud Control (AWSCC) provider.

## Policies

### CloudWatch.1: A log metric filter and alarm should exist for usage of the "root" user

This policy ensures that a log metric filter and alarm exist to monitor usage of the "root" user. This helps detect unauthorized or unnecessary use of the root account, which should be minimized according to security best practices.

**Resource types:** `awscc_logs_metric_filter`, `awscc_cloudwatch_alarm`

### CloudWatch.2: Ensure a log metric filter and alarm exist for unauthorized API calls

This policy ensures that a log metric filter and alarm exist to monitor unauthorized API calls. This helps detect attempts to perform actions without the required permissions, which could indicate malicious activity.

**Resource types:** `awscc_logs_metric_filter`, `awscc_cloudwatch_alarm`

### CloudWatch.3: Ensure a log metric filter and alarm exist for Management Console sign-in without MFA

This policy ensures that a log metric filter and alarm exist to monitor AWS Management Console sign-ins that occur without multi-factor authentication (MFA). This helps enforce the use of MFA for all console access.

**Resource types:** `awscc_logs_metric_filter`, `awscc_cloudwatch_alarm`

### CloudWatch.4: Ensure a log metric filter and alarm exist for IAM policy changes

This policy ensures that a log metric filter and alarm exist to monitor changes to IAM policies. This helps detect unauthorized or unexpected changes to permissions.

**Resource types:** `awscc_logs_metric_filter`, `awscc_cloudwatch_alarm`

### CloudWatch.5: Ensure a log metric filter and alarm exist for CloudTrail configuration changes

This policy ensures that a log metric filter and alarm exist to monitor changes to CloudTrail configuration. This helps detect attempts to disable or modify logging, which could indicate an attempt to hide malicious activity.

**Resource types:** `awscc_logs_metric_filter`, `awscc_cloudwatch_alarm`

## Usage

To use these policies, include them in your Sentinel policy set in Terraform Cloud or Terraform Enterprise.

## Testing

Each policy includes test cases for both compliance and non-compliance scenarios. You can run these tests using the Sentinel CLI:

```bash
sentinel test
```
