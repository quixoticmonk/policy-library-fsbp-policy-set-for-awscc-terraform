# ecs-fargate-latest-platform-version

## Policy Description
This policy requires that resources of type `awscc_ecs_service` with Fargate launch type run on the latest Fargate platform version.

## Policy Requirements
This policy requires that ECS services using the Fargate launch type use the `LATEST` platform version to ensure they benefit from the most recent security updates and features.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [ECS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-2).

## Policy Result (Pass)
```
PASS - policies/ecs/ecs-fargate-latest-platform-version.sentinel
  PASS - policies/ecs/test/ecs-fargate-latest-platform-version/success.hcl

    trace:
      ecs-fargate-latest-platform-version.sentinel:61:1 - Rule "main"
        Value:
          true
```

## Policy Result (Fail)
```
FAIL - policies/ecs/ecs-fargate-latest-platform-version.sentinel
  FAIL - policies/ecs/test/ecs-fargate-latest-platform-version/failure.hcl


    logs:
      ECS Fargate services not running on the latest platform version:
        * awscc_ecs_service.fargate_service_old_version
    trace:
      ecs-fargate-latest-platform-version.sentinel:61:1 - Rule "main"
        Value:
          false
```

## Remediation
To remediate this issue, ensure that your ECS Fargate services use the `LATEST` platform version:

```hcl
resource "awscc_ecs_service" "example" {
  cluster         = "my-cluster"
  desired_count   = 2
  launch_type     = "FARGATE"
  platform_version = "LATEST"  # Use LATEST platform version
  task_definition = "my-task-definition"
}
```

Note: If you don't specify a `platform_version`, it defaults to `LATEST`, which is also compliant with this policy.

## Resources
- [AWS ECS Fargate Platform Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)
- [AWS Foundational Security Best Practices - ECS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-2)
