# ECS services do not have public IP addresses automatically assigned

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECS.4](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-4)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true
```

## Policy Result (Fail)
```
→ → Overall Result: false

ECS services with public IP addresses assigned automatically:
  * awscc_ecs_service.service_with_public_ip
```

## Remediation
To remediate this issue, ensure that ECS services do not automatically assign public IP addresses:

```hcl
resource "awscc_ecs_service" "example" {
  service_name  = "example-service"
  cluster       = awscc_ecs_cluster.example.arn
  desired_count = 2
  
  launch_type = "FARGATE"
  task_definition = awscc_ecs_task_definition.example.arn
  
  network_configuration {
    awsvpc_configuration {
      subnets = [awscc_subnet.private.id]
      security_groups = [awscc_security_group.example.id]
      
      # Do not assign public IP addresses
      assign_public_ip = false
    }
  }
}
```

## Resources
- [Amazon ECS Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_services.html)
- [ECS Task Networking](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task-networking.html)
- [AWS Foundational Security Best Practices - ECS.4](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-4)
