# ECS task definitions have logging enabled

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Monitoring |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECS.5](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-5)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true
```

## Policy Result (Fail)
```
→ → Overall Result: false

ECS task definitions without logging configuration:
  * awscc_ecs_task_definition.task_def_without_logging
  * awscc_ecs_task_definition.task_def_with_incomplete_logging
```

## Remediation
To remediate this issue, ensure that all containers in ECS task definitions have logging configuration:

```hcl
resource "awscc_ecs_task_definition" "example" {
  family = "example-task-definition"
  
  container_definitions = jsonencode([
    {
      name      = "example-container"
      image     = "nginx:latest"
      essential = true
      
      # Configure logging
      log_configuration = {
        log_driver = "awslogs"
        options = {
          "awslogs-group"         = "/ecs/example-task"
          "awslogs-region"        = "us-west-2"
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}
```

## Resources
- [Amazon ECS Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html)
- [ECS Task Definition Parameters - Log Configuration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#container_definition_logconfiguration)
- [AWS Foundational Security Best Practices - ECS.5](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-5)
