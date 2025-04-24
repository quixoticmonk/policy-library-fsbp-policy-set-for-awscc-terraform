# neptune-cluster-snapshots-encrypted

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_neptune_db_cluster_snapshot | Ensure Neptune DB cluster snapshots are encrypted at rest | AWS FSBP Neptune.6 |

## Description

This policy ensures that Neptune DB cluster snapshots are encrypted at rest. Encrypting snapshots at rest helps protect your data from unauthorized access to the underlying storage. When you encrypt your Neptune DB cluster snapshots, the data stored in these snapshots is secured using encryption keys managed by AWS Key Management Service (KMS).

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster_snapshot.encrypted_snapshot
  Neptune DB cluster snapshots should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-6 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster_snapshot.unencrypted_snapshot
  Neptune DB cluster snapshots should be encrypted at rest. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-6 for more details.
```

## How to Fix

To fix this issue, ensure that your Neptune DB cluster snapshots are encrypted by setting the `storage_encrypted` parameter to `true`:

```hcl
resource "awscc_neptune_db_cluster_snapshot" "example" {
  db_cluster_identifier          = "example-neptune-cluster"
  db_cluster_snapshot_identifier = "example-snapshot"
  storage_encrypted              = true
  
  # Optionally specify a KMS key
  kms_key_id                     = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-5678-90ab-cdef-example11111"
}
```

Note that if the source Neptune DB cluster is already encrypted, the snapshots will inherit the encryption settings automatically. However, it's a best practice to explicitly specify encryption for snapshots to ensure they are always encrypted.
