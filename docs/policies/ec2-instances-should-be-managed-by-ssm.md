# SSM.1: EC2 instances should be managed by AWS Systems Manager

## Description
This policy ensures that EC2 instances are managed by AWS Systems Manager. Systems Manager provides visibility and control of your infrastructure on AWS, allowing for secure operations management at scale.

## Requirements
This policy requires that EC2 instances have an IAM instance profile attached that includes permissions for Systems Manager.

## Resource Types
- awscc_ec2_instance

## Policy Result (Pass)
```
PASS - ec2-instances-should-be-managed-by-ssm.sentinel
  PASS - test/ec2-instances-should-be-managed-by-ssm/success.hcl
```

## Policy Result (Fail)
```
FAIL - ec2-instances-should-be-managed-by-ssm.sentinel
  FAIL - test/ec2-instances-should-be-managed-by-ssm/failure.hcl

    logs:
      EC2 instances not managed by AWS Systems Manager:
        * awscc_ec2_instance.unmanaged_instance
    trace:
      ec2-instances-should-be-managed-by-ssm.sentinel:52:1 - Rule "main"
        Description:
          Main rule

        Value:
          false
```

## Remediation
Ensure that EC2 instances have an IAM instance profile attached with the necessary permissions for Systems Manager:

```hcl
resource "awscc_ec2_instance" "example" {
  instance_type = "t3.micro"
  image_id      = "ami-0c55b159cbfafe1f0"
  subnet_id     = "subnet-0123456789abcdef0"
  
  # Attach an IAM instance profile with SSM permissions
  iam_instance_profile = "SSMInstanceProfile"
  
  tags = [
    {
      key   = "Name"
      value = "managed-instance"
    }
  ]
}
```

The IAM instance profile should have at least the `AmazonSSMManagedInstanceCore` policy attached to allow Systems Manager to manage the instance.
