# neptune-iam-auth-enabled

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_neptune_db_cluster | Ensure Neptune DB clusters have IAM database authentication enabled | AWS FSBP Neptune.7 |

## Description

This policy ensures that Neptune DB clusters have IAM database authentication enabled. IAM database authentication allows you to authenticate to your Neptune DB cluster using AWS Identity and Access Management (IAM) users and roles. With IAM database authentication, you don't need to use a password when you connect to a DB cluster. Instead, you use an authentication token.

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster.iam_auth_enabled
  Neptune DB clusters should have IAM database authentication enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-7 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster.no_iam_auth
  Neptune DB clusters should have IAM database authentication enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-7 for more details.
```

## How to Fix

To fix this issue, set the `iam_database_authentication_enabled` parameter to `true` when creating your Neptune DB cluster:

```hcl
resource "awscc_neptune_db_cluster" "example" {
  cluster_identifier                  = "example-neptune-cluster"
  engine                              = "neptune"
  iam_database_authentication_enabled = true
  storage_encrypted                   = true
  
  # Other configuration parameters
  backup_retention_period             = 7
  preferred_backup_window             = "07:00-09:00"
  skip_final_snapshot                 = false
  final_snapshot_identifier           = "example-final-snapshot"
}
```

By enabling IAM database authentication, you can manage database access using IAM policies, providing a more secure and centralized approach to authentication.
