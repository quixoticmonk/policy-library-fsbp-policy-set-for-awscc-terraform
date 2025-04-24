# neptune-cluster-snapshots-not-public

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_neptune_db_cluster_snapshot | Ensure Neptune DB cluster snapshots are not public | AWS FSBP Neptune.3 |

## Description

This policy ensures that Neptune DB cluster snapshots are not publicly accessible. Making database snapshots public can expose sensitive data to unauthorized users. This policy checks that the `public` attribute is not set to `true` for any Neptune DB cluster snapshots.

## Policy Result (Success)

```
PASS - awscc_neptune_db_cluster_snapshot.private_snapshot
  Neptune DB cluster snapshots should not be public. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-3 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_cluster_snapshot.public_snapshot
  Neptune DB cluster snapshots should not be public. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-3 for more details.
```

## How to Fix

To fix this issue, ensure that the `public` parameter is not set to `true` when creating your Neptune DB cluster snapshots:

```hcl
resource "awscc_neptune_db_cluster_snapshot" "example" {
  db_cluster_identifier          = "example-neptune-cluster"
  db_cluster_snapshot_identifier = "example-snapshot"
  
  # Either omit the public parameter or explicitly set it to false
  public = false
}
```

By keeping your Neptune DB cluster snapshots private, you prevent unauthorized access to potentially sensitive data contained in those snapshots.
