module "tfplan-functions" {
  source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

policy "sqs-queues-encrypted-at-rest" {
  source = "./sqs-queues-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}
