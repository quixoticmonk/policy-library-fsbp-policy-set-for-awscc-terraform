# dynamodb-tables-in-backup-plan

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_dynamodb_table | Ensure DynamoDB tables are included in a backup plan | AWS FSBP DynamoDB.4 |

## Description

This policy ensures that all DynamoDB tables are included in an AWS Backup plan. AWS Backup is a fully managed backup service that makes it easy to centralize and automate the backup of data across AWS services. By including DynamoDB tables in a backup plan, you can ensure that your data is regularly backed up and can be restored in case of accidental deletion, application errors, or other data loss scenarios.

## Policy Result (Success)

```
PASS - awscc_dynamodb_table.table_with_backup
  DynamoDB tables should be in a backup plan. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-dynamodb-4 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_dynamodb_table.table_without_backup
  DynamoDB tables should be in a backup plan. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-dynamodb-4 for more details.
```

## How to Fix

To fix this issue, include your DynamoDB tables in an AWS Backup plan by creating an AWS Backup selection that includes your DynamoDB tables:

```hcl
resource "awscc_backup_plan" "example" {
  backup_plan {
    backup_plan_name = "example-backup-plan"
    backup_plan_rule {
      rule_name = "daily-backup"
      target_backup_vault_name = "Default"
      schedule_expression = "cron(0 5 ? * * *)"
    }
  }
}

resource "awscc_backup_selection" "example" {
  backup_plan_id = awscc_backup_plan.example.id
  iam_role_arn = awscc_iam_role.backup_role.arn
  selection_name = "dynamodb-tables"
  resources = [
    "arn:aws:dynamodb:*:*:table/your-table-name",
    # You can also use wildcards to include multiple tables
    # "arn:aws:dynamodb:*:*:table/*"
  ]
}
```

Alternatively, you can use AWS Backup's tag-based selection to include DynamoDB tables with specific tags in your backup plan:

```hcl
resource "awscc_backup_selection" "example" {
  backup_plan_id = awscc_backup_plan.example.id
  iam_role_arn = awscc_iam_role.backup_role.arn
  selection_name = "dynamodb-tables-by-tag"
  
  list_of_tags {
    condition_type = "STRINGEQUALS"
    condition_key = "Backup"
    condition_value = "true"
  }
}
```

Then, ensure your DynamoDB tables have the appropriate tags:

```hcl
resource "awscc_dynamodb_table" "example" {
  # ... other configuration ...
  
  tags = [
    {
      key = "Backup"
      value = "true"
    }
  ]
}
```
