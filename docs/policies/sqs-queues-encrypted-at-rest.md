# SQS.1: Amazon SQS queues should be encrypted at rest

| Provider | Category | Resource Type | Severity |
|----------|----------|--------------|----------|
| AWSCC | Security | SQS | MEDIUM |

## Description

This policy ensures that Amazon SQS queues are encrypted at rest using AWS KMS. Encrypting data at rest reduces the risk of data stored on disk being accessed by a user not authenticated to AWS. It also adds another set of access controls to limit the ability of unauthorized users to access the data. For example, API permissions are required to decrypt the data before it can be read.

## Remediation

To remediate this issue, configure SQS queues to use encryption at rest:

### Console

1. Open the Amazon SQS console at https://console.aws.amazon.com/sqs/
2. In the navigation pane, choose Queues
3. Select the queue that you want to configure
4. Choose Edit
5. Expand Encryption
6. For Server-side encryption, choose Enabled
7. Choose either Amazon SQS key (SSE-SQS) or Custom KMS key (SSE-KMS)
8. If you choose Custom KMS key (SSE-KMS), specify the KMS key identifier
9. Choose Save

### Terraform

```hcl
resource "awscc_sqs_queue" "example" {
  queue_name = "example-queue"
  
  # Option 1: Use SQS managed encryption
  sqs_managed_sse_enabled = true
  
  # Option 2: Use a custom KMS key
  # kms_master_key_id = "arn:aws:kms:us-west-2:123456789012:key/1234abcd-12ab-34cd-56ef-1234567890ab"
}
```

## Additional Information

- [Amazon SQS Encryption Documentation](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/sqs-server-side-encryption.html)
- [AWS Security Hub SQS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-sqs-1)

## Policy Results

### Failure

```
trace:
      sqs-queues-encrypted-at-rest.sentinel:40:1 - Rule "main"
        false

    SQS queues without encryption at rest enabled:
      * awscc_sqs_queue.queue_without_encryption
      * awscc_sqs_queue.queue_with_empty_kms_key
      * awscc_sqs_queue.queue_with_false_sse
```

### Success

```
trace:
      sqs-queues-encrypted-at-rest.sentinel:40:1 - Rule "main"
        true
```
