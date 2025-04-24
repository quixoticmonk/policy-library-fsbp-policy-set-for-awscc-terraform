# neptune-auto-minor-version-upgrade

| Provider | Category | Resource Type | Policy Check | Policy Source |
|----------|----------|--------------|--------------|---------------|
| awscc | security | awscc_neptune_db_instance | Ensure Neptune DB instances have automatic minor version upgrades enabled | AWS FSBP Neptune.5 |

## Description

This policy ensures that Neptune DB instances have automatic minor version upgrades enabled. Enabling automatic minor version upgrades ensures that the latest minor version updates to the Neptune database engine are installed automatically. These updates typically include security patches and bug fixes that help maintain the security and operational reliability of your database.

## Policy Result (Success)

```
PASS - awscc_neptune_db_instance.auto_upgrade_enabled
  Neptune DB instances should have automatic minor version upgrades enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-5 for more details.
```

## Policy Result (Failure)

```
FAIL - awscc_neptune_db_instance.no_auto_upgrade
  Neptune DB instances should have automatic minor version upgrades enabled. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-neptune-5 for more details.
```

## How to Fix

To fix this issue, set the `auto_minor_version_upgrade` parameter to `true` when creating your Neptune DB instance:

```hcl
resource "awscc_neptune_db_instance" "example" {
  db_instance_identifier     = "example-neptune-instance"
  db_instance_class          = "db.r5.large"
  engine                     = "neptune"
  db_cluster_identifier      = "example-neptune-cluster"
  auto_minor_version_upgrade = true
  
  # Other configuration parameters
  availability_zone          = "us-west-2a"
  preferred_maintenance_window = "sun:05:00-sun:06:00"
}
```

By enabling automatic minor version upgrades, you ensure that your Neptune DB instances automatically receive important security patches and bug fixes, helping to maintain the security and reliability of your database.
