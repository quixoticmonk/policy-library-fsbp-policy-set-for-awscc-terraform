# RDS.17 — RDS DB instances should be configured to copy tags to snapshots

## Policy Details

* **Severity:** Low
* **Provider:** awscc
* **Resource Type:** awscc_rds_db_instance
* **Policy Enforcement:** This policy will check if RDS DB instances are configured to copy tags to snapshots.

## Description

This policy ensures that Amazon RDS DB instances are configured to copy tags to snapshots. Enabling the copy tags to snapshot feature ensures that RDS database tags are copied to snapshots when you create them. This helps maintain proper categorization and organization of your RDS resources and snapshots, making it easier to track costs, control access, and enforce compliance.

## Policy Result (Pass)

```
trace: rds-instance-copy-tags-to-snapshot.sentinel:47:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
trace: rds-instance-copy-tags-to-snapshot.sentinel:47:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your RDS DB instance configuration to enable copying tags to snapshots:

```hcl
resource "awscc_rds_db_instance" "example" {
  db_instance_identifier = "example-instance"
  engine                = "mysql"
  engine_version        = "8.0.28"
  master_username       = "admin"
  master_user_password  = "password123"
  copy_tags_to_snapshot = true
}
```

## References

- [AWS Foundational Security Best Practices - RDS.17](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-rds-17)
- [AWS RDS Tagging Resources](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_Tagging.html)
