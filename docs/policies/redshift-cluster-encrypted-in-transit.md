# redshift-cluster-encrypted-in-transit

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_redshift_cluster_parameter_group | Ensure connections to Amazon Redshift clusters are encrypted in transit | AWS FSBP Redshift.2 |

## Description

This policy ensures that connections to Amazon Redshift clusters are encrypted in transit. Encrypting data in transit can affect performance, but it provides an additional layer of protection by ensuring that sensitive data cannot be intercepted and read by unauthorized users while it is being transmitted between clients and the Redshift cluster.

## Policy Result (Success)

```
PASS - awscc_redshift_cluster_parameter_group.encrypted_transit
  Connections to Amazon Redshift clusters should be encrypted in transit. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-redshift-2 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_redshift_cluster_parameter_group.unencrypted_transit
  Connections to Amazon Redshift clusters should be encrypted in transit. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-redshift-2 for more details.
```

## How to Fix

To fix this issue, create a Redshift cluster parameter group with the `require_ssl` parameter set to `true` and associate it with your Redshift cluster:

```hcl
resource "awscc_redshift_cluster_parameter_group" "example" {
  description           = "Parameter group with SSL enabled"
  parameter_group_name  = "encrypted-transit-param-group"
  parameter_group_family = "redshift-1.0"
  
  parameters = [
    {
      parameter_name  = "require_ssl"
      parameter_value = "true"
    }
  ]
}

resource "awscc_redshift_cluster" "example" {
  cluster_identifier        = "example-cluster"
  master_username           = "admin"
  master_user_password      = "Password123!"
  node_type                 = "dc2.large"
  number_of_nodes           = 2
  
  # Associate the parameter group that requires SSL
  cluster_parameter_group_name = awscc_redshift_cluster_parameter_group.example.parameter_group_name
}
```

By setting the `require_ssl` parameter to `true`, you ensure that all connections to your Redshift cluster are encrypted in transit, protecting your data as it moves between clients and the cluster.
