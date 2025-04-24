# redshift-cluster-automatic-snapshots-enabled

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_redshift_cluster | Ensure Amazon Redshift clusters have automatic snapshots enabled | AWS FSBP Redshift.3 |

## Description

This policy ensures that Amazon Redshift clusters have automatic snapshots enabled. Automated snapshots allow you to restore your cluster to a specific point in time, which helps protect your data from accidental deletion, corruption, or malicious actions. By default, Amazon Redshift enables automated snapshots with a retention period of 1 day, but it's recommended to configure a longer retention period based on your recovery requirements.

## Policy Result (Success)

```
PASS - awscc_redshift_cluster.snapshots_enabled
PASS - awscc_redshift_cluster.default_snapshots
  Amazon Redshift clusters should have automatic snapshots enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-redshift-3 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_redshift_cluster.snapshots_disabled
  Amazon Redshift clusters should have automatic snapshots enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-redshift-3 for more details.
```

## How to Fix

To fix this issue, set the `automated_snapshot_retention_period` parameter to a value greater than 0 in your Redshift cluster configuration:

```hcl
resource "awscc_redshift_cluster" "example" {
  cluster_identifier  = "example-cluster"
  master_username     = "admin"
  master_user_password = "Password123!"
  node_type           = "dc2.large"
  number_of_nodes     = 2
  
  # Enable automatic snapshots with a 7-day retention period
  automated_snapshot_retention_period = 7
}
```

By setting `automated_snapshot_retention_period` to a value greater than 0, you ensure that automatic snapshots are enabled for your Redshift cluster. The value represents the number of days that automated snapshots will be retained. A higher value provides a longer recovery window but may incur additional storage costs.
