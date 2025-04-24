# dynamodb-auto-scaling-enabled

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | performance | awscc_dynamodb_table | Ensure DynamoDB tables have automatic scaling enabled or use on-demand capacity | AWS FSBP DynamoDB.1 |

## Description

This policy ensures that DynamoDB tables either have automatic scaling enabled or use on-demand capacity mode. DynamoDB auto scaling uses the AWS Application Auto Scaling service to dynamically adjust provisioned throughput capacity on your behalf, in response to actual traffic patterns. This helps you optimize your table's provisioned capacity usage and reduce costs. Alternatively, on-demand capacity mode eliminates the need to plan for capacity by automatically scaling up and down based on the application's traffic.

## Policy Result (Success)

```
PASS - awscc_dynamodb_table.test_table
  DynamoDB tables should have automatic scaling enabled or use on-demand capacity. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-dynamodb-1 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_dynamodb_table.test_table
  DynamoDB tables should have automatic scaling enabled or use on-demand capacity. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-dynamodb-1 for more details.
```

## How to Fix

To fix this issue, you can either:

1. Configure your DynamoDB table to use on-demand capacity mode:

```hcl
resource "awscc_dynamodb_table" "example" {
  table_name = "example-table"
  billing_mode = "PAY_PER_REQUEST"
  
  attribute_definitions = [
    {
      attribute_name = "id"
      attribute_type = "S"
    }
  ]
  
  key_schema = [
    {
      attribute_name = "id"
      key_type       = "HASH"
    }
  ]
}
```

2. Or, configure your DynamoDB table with provisioned capacity and auto scaling:

```hcl
resource "awscc_dynamodb_table" "example" {
  table_name = "example-table"
  billing_mode = "PROVISIONED"
  
  provisioned_throughput = {
    read_capacity_units = 5
    write_capacity_units = 5
  }
  
  read_capacity_auto_scaling = {
    minimum_capacity = 5
    maximum_capacity = 100
    target_tracking_scaling_policy_configuration = {
      target_value = 70
    }
  }
  
  write_capacity_auto_scaling = {
    minimum_capacity = 5
    maximum_capacity = 100
    target_tracking_scaling_policy_configuration = {
      target_value = 70
    }
  }
  
  attribute_definitions = [
    {
      attribute_name = "id"
      attribute_type = "S"
    }
  ]
  
  key_schema = [
    {
      attribute_name = "id"
      key_type       = "HASH"
    }
  ]
}
```

By implementing either of these configurations, you ensure that your DynamoDB table can handle varying workloads efficiently and cost-effectively.
