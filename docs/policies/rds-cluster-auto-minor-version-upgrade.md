# RDS.35 — RDS DB clusters should have automatic minor version upgrades enabled

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_rds_db_cluster
* **Policy Enforcement:** This policy will check if RDS DB clusters have automatic minor version upgrades enabled.

## Description

This policy ensures that Amazon RDS DB clusters have automatic minor version upgrades enabled. Enabling automatic minor version upgrades ensures that the latest minor version updates to the relational database management system (RDBMS) are installed. These upgrades might include security patches and bug fixes. Keeping up to date with patch installation is an important step in securing systems.

## Policy Result (Pass)

```
trace: rds-cluster-auto-minor-version-upgrade.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
trace: rds-cluster-auto-minor-version-upgrade.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your RDS DB cluster configuration to enable automatic minor version upgrades:

```hcl
resource "awscc_rds_db_cluster" "example" {
  db_cluster_identifier     = "example-cluster"
  engine                    = "aurora-mysql"
  engine_version            = "8.0.mysql_aurora.3.02.0"
  master_username           = "admin"
  master_user_password      = "password123"
  auto_minor_version_upgrade = true
}
```

## References

- [AWS Foundational Security Best Practices - RDS.35](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-rds-35)
- [AWS RDS Automatic Minor Version Upgrades](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/USER_UpgradeDBInstance.Upgrading.html#USER_UpgradeDBInstance.Upgrading.AutoMinorVersionUpgrades)
