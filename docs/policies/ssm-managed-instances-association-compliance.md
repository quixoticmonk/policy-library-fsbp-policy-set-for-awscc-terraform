# SSM.3: EC2 instances managed by Systems Manager should have an association compliance status of COMPLIANT

## Description
This policy ensures that EC2 instances managed by AWS Systems Manager have an association compliance status of COMPLIANT. This helps maintain security by ensuring that critical and high-severity associations are properly configured.

## Requirements
This policy requires that SSM associations have a compliance severity of CRITICAL or HIGH.

## Resource Types
- awscc_ssm_association

## Policy Result (Pass)
```
PASS - ssm-managed-instances-association-compliance.sentinel
  PASS - test/ssm-managed-instances-association-compliance/success.hcl
```

## Policy Result (Fail)
```
FAIL - ssm-managed-instances-association-compliance.sentinel
  FAIL - test/ssm-managed-instances-association-compliance/failure.hcl

    logs:
      SSM associations without proper compliance severity:
        * awscc_ssm_association.non_compliant_association
        * awscc_ssm_association.no_compliance_severity
    trace:
      ssm-managed-instances-association-compliance.sentinel:52:1 - Rule "main"
        Description:
          Main rule

        Value:
          false
```

## Remediation
Ensure that SSM associations have a compliance severity of CRITICAL or HIGH:

```hcl
resource "awscc_ssm_association" "example" {
  name                = "AWS-UpdateSSMAgent"
  targets = [
    {
      key    = "InstanceIds"
      values = ["i-0123456789abcdef0"]
    }
  ]
  
  compliance_severity = "CRITICAL"  # Set to CRITICAL or HIGH
  schedule_expression = "rate(7 days)"
}
```
