# RDS.28 — RDS DB clusters should be encrypted at rest

## Policy Details

* **Severity:** Medium
* **Provider:** awscc
* **Resource Type:** awscc_rds_db_cluster
* **Policy Enforcement:** This policy will check if RDS DB clusters are encrypted at rest.

## Description

This policy ensures that Amazon RDS DB clusters are encrypted at rest. Encrypting data at rest reduces the risk that an unauthorized user gets access to data that is stored on disk. This adds another set of access controls to limit the ability of unauthorized users to access the data. For example, API permissions are required to decrypt the data before it can be read.

## Policy Result (Pass)

```
trace: rds-cluster-encryption-at-rest.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    true
```

## Policy Result (Fail)

```
trace: rds-cluster-encryption-at-rest.sentinel:93:1 - Rule "main"
  Description:
    Rules

  Value:
    false
```

## Remediation

To remediate this issue, update your RDS DB cluster configuration to enable encryption at rest:

```hcl
resource "awscc_rds_db_cluster" "example" {
  db_cluster_identifier = "example-cluster"
  engine               = "aurora-mysql"
  engine_version       = "8.0.mysql_aurora.3.02.0"
  master_username      = "admin"
  master_user_password = "password123"
  storage_encrypted    = true
  kms_key_id           = "arn:aws:kms:us-west-2:123456789012:key/abcd1234-a123-456a-a12b-a123b4cd56ef"
}
```

## References

- [AWS Foundational Security Best Practices - RDS.28](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-rds-28)
- [AWS RDS Encryption at Rest](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Overview.Encryption.html)
