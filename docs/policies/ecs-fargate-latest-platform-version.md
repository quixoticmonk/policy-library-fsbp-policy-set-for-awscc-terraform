# ECS Fargate services use the latest platform version

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-3)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true
```

## Policy Result (Fail)
```
→ → Overall Result: false

ECS Fargate services not running on the latest platform version:
  * awscc_ecs_service.fargate_service_old_version
```

## Remediation
To remediate this issue, ensure that all ECS Fargate services use the latest platform version:

```hcl
resource "awscc_ecs_service" "example" {
  service_name  = "example-service"
  cluster       = awscc_ecs_cluster.example.arn
  desired_count = 2
  
  # Use Fargate launch type
  launch_type = "FARGATE"
  
  # Use the latest platform version
  platform_version = "LATEST"
  
  task_definition = awscc_ecs_task_definition.example.arn
  
  network_configuration {
    awsvpc_configuration {
      subnets = [awscc_subnet.example.id]
      security_groups = [awscc_security_group.example.id]
    }
  }
}
```

## Resources
- [Amazon ECS Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_services.html)
- [AWS Fargate Platform Versions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/platform_versions.html)
- [AWS Foundational Security Best Practices - ECS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-3)
