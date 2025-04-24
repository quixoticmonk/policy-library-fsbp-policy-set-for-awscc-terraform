# RDS.15 — RDS DB clusters should be configured for multiple Availability Zones

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_rds_db_cluster
* **Policy Enforcement:** This policy will check if RDS DB clusters are configured to use multiple Availability Zones.

## Description

This policy ensures that Amazon RDS DB clusters are configured to use multiple Availability Zones. Deploying RDS DB clusters across multiple Availability Zones increases the availability of your database. In the event of an infrastructure failure, RDS automatically fails over to the standby instance.

## Policy Result (Pass)

```
trace: rds-cluster-multi-az.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
trace: rds-cluster-multi-az.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your RDS DB cluster configuration to use multiple Availability Zones:

```hcl
resource "awscc_rds_db_cluster" "example" {
  db_cluster_identifier = "example-cluster"
  engine               = "aurora-mysql"
  engine_version       = "8.0.mysql_aurora.3.02.0"
  master_username      = "admin"
  master_user_password = "password123"
  availability_zones   = ["us-west-2a", "us-west-2b", "us-west-2c"]
}
```

## References

- [AWS Foundational Security Best Practices - RDS.15](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-rds-15)
- [AWS RDS Multi-AZ Deployments](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html)
