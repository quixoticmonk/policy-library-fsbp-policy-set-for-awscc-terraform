module "tfplan-functions" {
  source = "./modules/tfplan-functions/tfplan-functions.sentinel"
}

module "tfconfig-functions" {
  source = "./modules/tfconfig-functions/tfconfig-functions.sentinel"
}

module "tfresources" {
  source = "./modules/tfresources/tfresources.sentinel"
}

module "report" {
  source = "./modules/report/report.sentinel"
}

# CloudWatch Policies
policy "cloudwatch-root-user-usage-alarm" {
  source = "./policies/cloudwatch/cloudwatch-root-user-usage-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-unauthorized-api-calls-alarm" {
  source = "./policies/cloudwatch/cloudwatch-unauthorized-api-calls-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-console-signin-without-mfa-alarm" {
  source = "./policies/cloudwatch/cloudwatch-console-signin-without-mfa-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-iam-policy-changes-alarm" {
  source = "./policies/cloudwatch/cloudwatch-iam-policy-changes-alarm.sentinel"
  enforcement_level = "advisory"
}

policy "cloudwatch-cloudtrail-config-changes-alarm" {
  source = "./policies/cloudwatch/cloudwatch-cloudtrail-config-changes-alarm.sentinel"
  enforcement_level = "advisory"
}

# CloudTrail Policies
policy "cloudtrail-log-file-validation-enabled" {
  source = "./policies/cloudtrail/cloudtrail-log-file-validation-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-server-side-encryption-enabled" {
  source = "./policies/cloudtrail/cloudtrail-server-side-encryption-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-cloudwatch-logs-group-arn-present" {
  source = "./policies/cloudtrail/cloudtrail-cloudwatch-logs-group-arn-present.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-bucket-access-logging-enabled" {
  source = "./policies/cloudtrail/cloudtrail-bucket-access-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "cloudtrail-logs-bucket-not-public" {
  source = "./policies/cloudtrail/cloudtrail-logs-bucket-not-public.sentinel"
  enforcement_level = "advisory"
}

# SecretsManager Policies
policy "secretsmanager-rotation-enabled" {
  source = "./policies/secretsmanager/secretsmanager-rotation-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "secretsmanager-rotation-within-days" {
  source = "./policies/secretsmanager/secretsmanager-rotation-within-days.sentinel"
  enforcement_level = "advisory"
}

# SNS Policies
policy "sns-encryption-at-rest-enabled" {
  source = "./policies/sns/sns-encryption-at-rest-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "sns-delivery-status-logging-enabled" {
  source = "./policies/sns/sns-delivery-status-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

# ECR Policies
policy "ecr-image-scanning-enabled" {
  source = "./policies/ecr/ecr-image-scanning-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ecr-tag-immutability-enabled" {
  source = "./policies/ecr/ecr-tag-immutability-enabled.sentinel"
  enforcement_level = "advisory"
}

# ECS Policies
policy "ecs-clusters-container-insights" {
  source = "./policies/ecs/ecs-clusters-container-insights.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-fargate-latest-platform-version" {
  source = "./policies/ecs/ecs-fargate-latest-platform-version.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-definitions-no-host-process-namespace" {
  source = "./policies/ecs/ecs-task-definitions-no-host-process-namespace.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-services-no-public-ip" {
  source = "./policies/ecs/ecs-services-no-public-ip.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-definitions-logging-enabled" {
  source = "./policies/ecs/ecs-task-definitions-logging-enabled.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-containers-readonly-root" {
  source = "./policies/ecs/ecs-containers-readonly-root.sentinel"
  enforcement_level = "advisory"
}

policy "ecs-task-definitions-secure-networking" {
  source = "./policies/ecs/ecs-task-definitions-secure-networking.sentinel"
  enforcement_level = "advisory"
}
