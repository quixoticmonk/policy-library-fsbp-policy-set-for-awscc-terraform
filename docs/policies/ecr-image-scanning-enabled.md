# ecr-image-scanning-enabled

## Policy Description
This policy requires that resources of type `awscc_ecr_repository` have image scanning configured.

## Policy Requirements
This policy requires that ECR private repositories have image scanning enabled by setting `scan_on_push` to `true` in the `image_scanning_configuration` block.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [ECR.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-1).

## Policy Result (Pass)
```
PASS - policies/ecr/ecr-image-scanning-enabled.sentinel
  PASS - policies/ecr/test/ecr-image-scanning-enabled/success.hcl


    logs:
      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ecr-image-scanning-enabled.

      ✓ Found 0 resource violations
    trace:
      ecr-image-scanning-enabled.sentinel:98:1 - Rule "main"
        Value:
          true
```

## Policy Result (Fail)
```
FAIL - policies/ecr/ecr-image-scanning-enabled.sentinel
  FAIL - policies/ecr/test/ecr-image-scanning-enabled/failure.hcl


    logs:
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
    trace:
      ecr-image-scanning-enabled.sentinel:98:1 - Rule "main"
        Value:
          false
```

## Remediation
To remediate this issue, ensure that image scanning is enabled for your ECR repositories:

```hcl
resource "awscc_ecr_repository" "example" {
  repository_name = "example-repo"
  
  image_scanning_configuration {
    scan_on_push = true
  }
}
```

## Resources
- [AWS ECR Image Scanning](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html)
- [AWS Foundational Security Best Practices - ECR.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-1)
