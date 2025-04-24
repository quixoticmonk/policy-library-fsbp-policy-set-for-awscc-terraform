# SSM.2: EC2 instances managed by Systems Manager should have a patch compliance status of COMPLIANT after a patch installation

## Description
This policy ensures that EC2 instances managed by AWS Systems Manager have a patch compliance status of COMPLIANT after a patch installation. This helps maintain security by ensuring that critical and high-severity patches are applied.

## Requirements
This policy requires that SSM patch baselines have approval rules with a compliance level of CRITICAL or HIGH.

## Resource Types
- awscc_ssm_patch_baseline

## Policy Result (Pass)
```
PASS - ssm-managed-instances-compliance.sentinel
  PASS - test/ssm-managed-instances-compliance/success.hcl
```

## Policy Result (Fail)
```
FAIL - ssm-managed-instances-compliance.sentinel
  FAIL - test/ssm-managed-instances-compliance/failure.hcl

    logs:
      SSM patch baselines without proper compliance settings:
        * awscc_ssm_patch_baseline.non_compliant_baseline
        * awscc_ssm_patch_baseline.no_approval_rules
    trace:
      ssm-managed-instances-compliance.sentinel:52:1 - Rule "main"
        Description:
          Main rule

        Value:
          false
```

## Remediation
Ensure that SSM patch baselines have approval rules with a compliance level of CRITICAL or HIGH:

```hcl
resource "awscc_ssm_patch_baseline" "example" {
  name            = "compliant-baseline"
  description     = "Patch baseline with CRITICAL compliance level"
  operating_system = "AMAZON_LINUX_2"
  
  approval_rules = {
    patch_rules = [
      {
        approve_after_days = 7
        compliance_level   = "CRITICAL"  # Set to CRITICAL or HIGH
        patch_filter_group = {
          patch_filters = [
            {
              key    = "PRODUCT"
              values = ["AmazonLinux2"]
            }
          ]
        }
      }
    ]
  }
  
  tags = [
    {
      key   = "Name"
      value = "compliant-baseline"
    }
  ]
}
```
