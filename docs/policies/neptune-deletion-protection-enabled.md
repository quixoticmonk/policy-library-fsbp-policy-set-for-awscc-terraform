# neptune-deletion-protection-enabled

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_neptune_db_cluster | Ensure Neptune DB clusters have deletion protection enabled | AWS FSBP Neptune.4 |

## Description

This policy ensures that Neptune DB clusters have deletion protection enabled. Deletion protection prevents your database from being accidentally deleted. When deletion protection is enabled, a database cannot be deleted by any user. This additional safeguard helps prevent accidental or unauthorized deletion of your Neptune database clusters.

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster.deletion_protection_enabled
  Neptune DB clusters should have deletion protection enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-4 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster.no_deletion_protection
  Neptune DB clusters should have deletion protection enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-4 for more details.
```

## How to Fix

To fix this issue, set the `deletion_protection` parameter to `true` when creating your Neptune DB cluster:

```hcl
resource "awscc_neptune_db_cluster" "example" {
  cluster_identifier        = "example-neptune-cluster"
  engine                    = "neptune"
  storage_encrypted         = true
  deletion_protection       = true
  
  # Other configuration parameters
  backup_retention_period   = 7
  preferred_backup_window   = "07:00-09:00"
  skip_final_snapshot       = false
  final_snapshot_identifier = "example-final-snapshot"
}
```

By enabling deletion protection, you add an additional layer of security that prevents accidental or unauthorized deletion of your Neptune DB clusters.
