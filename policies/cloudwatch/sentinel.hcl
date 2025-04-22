policy "cloudwatch-root-user-usage-alarm" {
  source = "./cloudwatch-root-user-usage-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-unauthorized-api-calls-alarm" {
  source = "./cloudwatch-unauthorized-api-calls-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-console-signin-without-mfa-alarm" {
  source = "./cloudwatch-console-signin-without-mfa-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-iam-policy-changes-alarm" {
  source = "./cloudwatch-iam-policy-changes-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-cloudtrail-config-changes-alarm" {
  source = "./cloudwatch-cloudtrail-config-changes-alarm.sentinel"
  enforcement_level = "advisory"
}
