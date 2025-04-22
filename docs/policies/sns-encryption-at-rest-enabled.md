# sns-encryption-at-rest-enabled

## Policy Description
This policy requires that resources of type `awscc_sns_topic` have encryption at rest enabled using AWS KMS.

## Policy Requirements
This policy requires that SNS topics have encryption at rest enabled by specifying a valid KMS key ID in the `kms_master_key_id` attribute.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [SNS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-sns-1).

## Policy Result (Pass)
```
PASS - policies/sns/sns-encryption-at-rest-enabled.sentinel
  PASS - policies/sns/test/sns-encryption-at-rest-enabled/success.hcl


    logs:
      → → Overall Result: true

      This result means that all resources have passed the policy check for the policy sns-encryption-at-rest-enabled.

      ✓ Found 0 resource violations
    trace:
      sns-encryption-at-rest-enabled.sentinel:100:1 - Rule "main"
        Value:
          true
```

## Policy Result (Fail)
```
FAIL - policies/sns/sns-encryption-at-rest-enabled.sentinel
  FAIL - policies/sns/test/sns-encryption-at-rest-enabled/failure.hcl


    logs:
      → → Overall Result: false

      This result means that not all resources passed the policy check and the protected behavior is not allowed for the policy sns-encryption-at-rest-enabled.

      Found 2 resource violations

      → Module name: root
         ↳ Resource Address: awscc_sns_topic.topic_without_encryption
           | ✗ failed
           | SNS topics should be encrypted at rest using AWS KMS. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-sns-1 for more details.
         ↳ Resource Address: awscc_sns_topic.topic_with_empty_kms_key
           | ✗ failed
           | SNS topics should be encrypted at rest using AWS KMS. Refer to https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-sns-1 for more details.
    trace:
      sns-encryption-at-rest-enabled.sentinel:100:1 - Rule "main"
        Value:
          false
```

## Remediation
To remediate this issue, ensure that your SNS topics have encryption at rest enabled using a KMS key:

```hcl
resource "awscc_sns_topic" "example" {
  name         = "example-topic"
  display_name = "Example Topic"
  
  # Specify a KMS key ID for encryption at rest
  kms_master_key_id = "arn:aws:kms:us-east-1:123456789012:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}
```

You can use either the KMS key ARN or the KMS key ID.

## Resources
- [AWS SNS Encryption at Rest](https://docs.aws.amazon.com/sns/latest/dg/sns-server-side-encryption.html)
- [AWS Foundational Security Best Practices - SNS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-sns-1)
