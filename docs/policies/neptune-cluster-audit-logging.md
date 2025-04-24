# neptune-cluster-audit-logging

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | monitoring | awscc_neptune_db_cluster | Ensure Neptune DB clusters publish audit logs to CloudWatch Logs | AWS FSBP Neptune.4 |

## Description

This policy ensures that Neptune DB clusters are configured to publish audit logs to Amazon CloudWatch Logs. Audit logging provides visibility into database activity, which is important for security and troubleshooting purposes. By sending audit logs to CloudWatch Logs, you can monitor, analyze, and respond to database activity in near real-time.

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster.audit_logs_enabled
  Neptune DB clusters should publish audit logs to CloudWatch Logs. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-4 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster.no_logs
  Neptune DB clusters should publish audit logs to CloudWatch Logs. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-4 for more details.
```

## How to Fix

To fix this issue, configure your Neptune DB cluster to export audit logs to CloudWatch Logs by setting the `enable_cloudwatch_logs_exports` parameter to include "audit":

```hcl
resource "awscc_neptune_db_cluster" "example" {
  cluster_identifier          = "example-neptune-cluster"
  engine                      = "neptune"
  storage_encrypted           = true
  
  # Enable audit logging to CloudWatch Logs
  enable_cloudwatch_logs_exports = ["audit"]
  
  # Other configuration parameters
  backup_retention_period     = 7
  preferred_backup_window     = "07:00-09:00"
  skip_final_snapshot         = false
  final_snapshot_identifier   = "example-final-snapshot"
}
```

By enabling audit logging to CloudWatch Logs, you gain visibility into database activity, which helps with security monitoring, compliance requirements, and troubleshooting.
