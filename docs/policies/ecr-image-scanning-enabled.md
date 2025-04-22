# ECR repositories have image scanning enabled

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECR.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-1)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true

This result means that all resources have passed the policy check for the policy ecr-image-scanning-enabled.

✓ Found 0 resource violations
```

## Policy Result (Fail)
```
→ → Overall Result: false

This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecr-image-scanning-enabled.

Found 2 resource violations

→ Module name: root
   ↳ Resource Address: awscc_ecr_repository.example
     | ✗ failed
     | ECR private repositories should have image scanning configured. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-1 for more details.
   ↳ Resource Address: awscc_ecr_repository.example2
     | ✗ failed
     | ECR private repositories should have image scanning configured. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-1 for more details.
```

## Remediation
To remediate this issue, ensure that image scanning is enabled for ECR repositories:

```hcl
resource "awscc_ecr_repository" "example" {
  repository_name = "example-repo"
  
  # Enable image scanning on push
  image_scanning_configuration {
    scan_on_push = true
  }
}
```

## Resources
- [AWS ECR Documentation](https://docs.aws.amazon.com/AmazonECR/latest/userguide/what-is-ecr.html)
- [Image Scanning in Amazon ECR](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html)
- [AWS Foundational Security Best Practices - ECR.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-1)
