# ECS task definitions do not share the host's process namespace

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECS.8](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-8)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true
```

## Policy Result (Fail)
```
→ → Overall Result: false

ECS task definitions that share the host's process namespace:
  * awscc_ecs_task_definition.task_def_with_host_pid
```

## Remediation
To remediate this issue, ensure that ECS task definitions do not use the host's process namespace:

```hcl
resource "awscc_ecs_task_definition" "example" {
  family = "example-task-definition"
  
  # Do not set pid_mode to "host"
  # pid_mode = "host"  # This would be a violation
  
  container_definitions = jsonencode([
    {
      name      = "example-container"
      image     = "nginx:latest"
      essential = true
    }
  ])
}
```

## Resources
- [Amazon ECS Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html)
- [ECS Task Definition Parameters - PID Mode](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#task_definition_pidmode)
- [AWS Foundational Security Best Practices - ECS.8](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-8)
