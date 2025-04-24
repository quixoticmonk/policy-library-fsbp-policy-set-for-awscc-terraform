# neptune-copy-tags-to-snapshots

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | management | awscc_neptune_db_cluster | Ensure Neptune DB clusters are configured to copy tags to snapshots | AWS FSBP Neptune.8 |

## Description

This policy ensures that Neptune DB clusters are configured to copy tags to snapshots. When you enable this feature, any tags associated with a Neptune DB cluster are automatically copied to snapshots created from that cluster. This helps maintain consistent metadata and simplifies resource tracking, cost allocation, and access control across your database resources and their backups.

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster.copy_tags_enabled
  Neptune DB clusters should be configured to copy tags to snapshots. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-8 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster.no_copy_tags
  Neptune DB clusters should be configured to copy tags to snapshots. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-8 for more details.
```

## How to Fix

To fix this issue, set the `copy_tags_to_snapshot` parameter to `true` when creating your Neptune DB cluster:

```hcl
resource "awscc_neptune_db_cluster" "example" {
  cluster_identifier        = "example-neptune-cluster"
  engine                    = "neptune"
  storage_encrypted         = true
  copy_tags_to_snapshot     = true
  
  # Other configuration parameters
  backup_retention_period   = 7
  preferred_backup_window   = "07:00-09:00"
  skip_final_snapshot       = false
  final_snapshot_identifier = "example-final-snapshot"
  
  tags = {
    Environment = "Production"
    Department  = "Data Science"
    Project     = "Graph Database"
  }
}
```

By enabling the copying of tags to snapshots, you ensure that your snapshots inherit the same tags as their source DB clusters, which helps with resource organization, tracking, and management.
