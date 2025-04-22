# ecr-tag-immutability-enabled

## Policy Description
This policy requires that resources of type `awscc_ecr_repository` have tag immutability configured.

## Policy Requirements
This policy requires that ECR private repositories have tag immutability enabled by setting `image_tag_mutability` to `"IMMUTABLE"`.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [ECR.2](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-2).

## Policy Result (Pass)
```
PASS - policies/ecr/ecr-tag-immutability-enabled.sentinel
  PASS - policies/ecr/test/ecr-tag-immutability-enabled/success.hcl


    logs:
      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy ecr-tag-immutability-enabled.

      ✓ Found 0 resource violations
    trace:
      ecr-tag-immutability-enabled.sentinel:97:1 - Rule "main"
        Value:
          true
```

## Policy Result (Fail)
```
FAIL - policies/ecr/ecr-tag-immutability-enabled.sentinel
  FAIL - policies/ecr/test/ecr-tag-immutability-enabled/failure.hcl


    logs:
      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy ecr-tag-immutability-enabled.

      Found 2 resource violations

      → Module name: root
         ↳ Resource Address: awscc_ecr_repository.example
           | ✗ failed
           | ECR private repositories should have tag immutability configured. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-2 for more details.
         ↳ Resource Address: awscc_ecr_repository.example2
           | ✗ failed
           | ECR private repositories should have tag immutability configured. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-2 for more details.
    trace:
      ecr-tag-immutability-enabled.sentinel:97:1 - Rule "main"
        Value:
          false
```

## Remediation
To remediate this issue, ensure that tag immutability is enabled for your ECR repositories:

```hcl
resource "awscc_ecr_repository" "example" {
  repository_name = "example-repo"
  image_tag_mutability = "IMMUTABLE"
}
```

## Resources
- [AWS ECR Image Tag Mutability](https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html)
- [AWS Foundational Security Best Practices - ECR.2](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecr-2)
