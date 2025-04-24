module "tfplan-functions" {
  source = "./common-functions/tfplan-functions/tfplan-functions.sentinel"
}

module "tfstate-functions" {
  source = "./common-functions/tfstate-functions/tfstate-functions.sentinel"
}

module "tfconfig-functions" {
  source = "./common-functions/tfconfig-functions/tfconfig-functions.sentinel"
}

module "aws-functions" {
  source = "./aws-functions/aws-functions.sentinel"
}

policy "sqs-queues-encrypted-at-rest" {
  source = "./FSBP/sqs/sqs-queues-encrypted-at-rest.sentinel"
  enforcement_level = "advisory"
}

policy "stepfunctions-logging-enabled" {
  source = "./FSBP/stepfunctions/stepfunctions-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ssm-documents-not-public" {
  source            = "./FSBP/ssm/ssm-documents-not-public.sentinel"
  enforcement_level = "advisory"
}

policy "ec2-instances-should-be-managed-by-ssm" {
  source            = "./FSBP/ssm/ec2-instances-should-be-managed-by-ssm.sentinel"
  enforcement_level = "advisory"
}

policy "ssm-managed-instances-compliance" {
  source            = "./FSBP/ssm/ssm-managed-instances-compliance.sentinel"
  enforcement_level = "advisory"
}

policy "ssm-managed-instances-association-compliance" {
  source            = "./FSBP/ssm/ssm-managed-instances-association-compliance.sentinel"
  enforcement_level = "advisory"
}
