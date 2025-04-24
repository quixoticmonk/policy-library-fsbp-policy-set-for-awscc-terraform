# redshift-cluster-prohibit-public-access

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_redshift_cluster | Ensure Amazon Redshift clusters prohibit public access | AWS FSBP Redshift.1 |

## Description

This policy ensures that Amazon Redshift clusters prohibit public access. Making Redshift clusters publicly accessible might allow unintended access to your data warehouse data. Redshift clusters should be deployed into private subnets in a VPC and should not be publicly accessible to reduce the risk of unauthorized access to your data.

## Policy Result (Success)

```
PASS - awscc_redshift_cluster.private_cluster
  Amazon Redshift clusters should prohibit public access. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-redshift-1 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_redshift_cluster.public_cluster
  Amazon Redshift clusters should prohibit public access. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-redshift-1 for more details.
```

## How to Fix

To fix this issue, set the `publicly_accessible` parameter to `false` in your Redshift cluster configuration:

```hcl
resource "awscc_redshift_cluster" "example" {
  cluster_identifier  = "example-cluster"
  master_username     = "admin"
  master_user_password = "Password123!"
  node_type           = "dc2.large"
  number_of_nodes     = 2
  
  # Ensure the cluster is not publicly accessible
  publicly_accessible = false
  
  # Deploy the cluster in a VPC
  cluster_subnet_group_name = "my-subnet-group"
  vpc_security_group_ids    = ["sg-12345678"]
}
```

By setting `publicly_accessible` to `false`, you ensure that your Redshift cluster can only be accessed from within your VPC, reducing the risk of unauthorized access.
