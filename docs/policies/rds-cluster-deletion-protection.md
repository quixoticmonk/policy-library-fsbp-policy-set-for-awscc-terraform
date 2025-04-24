# RDS.7 — RDS clusters should have deletion protection enabled

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_rds_db_cluster
* **Policy Enforcement:** This policy will check if RDS DB clusters have deletion protection enabled.

## Description

This policy ensures that Amazon RDS DB clusters have deletion protection enabled. Enabling deletion protection is an additional layer of protection against accidental database deletion or deletion by an unauthorized entity.

## Policy Result (Pass)

```
trace: rds-cluster-deletion-protection.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
trace: rds-cluster-deletion-protection.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your RDS DB cluster configuration to enable deletion protection:

```hcl
resource "awscc_rds_db_cluster" "example" {
  db_cluster_identifier = "example-cluster"
  engine               = "aurora-mysql"
  engine_version       = "8.0.mysql_aurora.3.02.0"
  master_username      = "admin"
  master_user_password = "password123"
  deletion_protection  = true
}
```

## References

- [AWS Foundational Security Best Practices - RDS.7](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-rds-7)
- [AWS RDS Deletion Protection](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_DeleteCluster.html#USER_DeleteCluster.DeletionProtection)
