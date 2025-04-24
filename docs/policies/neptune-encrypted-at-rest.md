# neptune-encrypted-at-rest

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_neptune_db_cluster | Ensure Neptune DB clusters are encrypted at rest | AWS FSBP Neptune.1 |

## Description

This policy ensures that Neptune DB clusters are encrypted at rest. Encrypting data at rest helps protect your data from unauthorized access to the underlying storage. When you encrypt your Neptune DB cluster, Amazon Neptune encrypts your databases, automated backups, snapshots, and replicas in the same cluster.

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster.encrypted_cluster
  Neptune DB clusters should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-1 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster.unencrypted_cluster
  Neptune DB clusters should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-1 for more details.
```

## How to Fix

To fix this issue, set the `storage_encrypted` parameter to `true` when creating your Neptune DB cluster:

```hcl
resource "awscc_neptune_db_cluster" "example" {
  cluster_identifier        = "example-neptune-cluster"
  engine                    = "neptune"
  storage_encrypted         = true
  kms_key_id                = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-5678-90ab-cdef-example11111" # Optional: Specify a KMS key
  
  # Other configuration parameters
  backup_retention_period   = 7
  preferred_backup_window   = "07:00-09:00"
  skip_final_snapshot       = false
  final_snapshot_identifier = "example-final-snapshot"
}
```

By setting `storage_encrypted` to `true`, you ensure that your Neptune DB cluster data is encrypted at rest, protecting your sensitive data from unauthorized access.
