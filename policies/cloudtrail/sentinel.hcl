module "tfplan-functions" {
  source = "../../modules/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
  source = "../../modules/tfconfig-functions/tfconfig-functions.sentinel"
}

module "tfresources" {
  source = "../../modules/tfresources/tfresources.sentinel"
}

module "report" {
  source = "../../modules/report/report.sentinel"
}

policy "cloudtrail-log-file-validation-enabled" {
  source = "./cloudtrail-log-file-validation-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-server-side-encryption-enabled" {
  source = "./cloudtrail-server-side-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "./cloudtrail-cloudwatch-logs-group-arn-present.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-bucket-access-logging-enabled" {
  source = "./cloudtrail-bucket-access-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-logs-bucket-not-public" {
  source = "./cloudtrail-logs-bucket-not-public.sentinel"
  enforcement_level = "advisory"
}
