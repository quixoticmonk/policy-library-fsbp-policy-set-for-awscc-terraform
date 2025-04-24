module "tfplan-functions" {
  source = "../common-functions/tfplan-functions/tfplan-functions.sentinel"
}

policy "stepfunctions-logging-enabled" {
  source = "./stepfunctions-logging-enabled.sentinel"
  enforcement_level = "advisory"
}
