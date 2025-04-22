# ECS containers use read-only root filesystems

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Security |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-2)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true
```

## Policy Result (Fail)
```
→ → Overall Result: false

ECS task definitions with containers that don't have read-only root filesystems:
  * awscc_ecs_task_definition.task_def_without_readonly_root
  * awscc_ecs_task_definition.task_def_missing_readonly_root
```

## Remediation
To remediate this issue, ensure that all containers in ECS task definitions use read-only root filesystems:

```hcl
resource "awscc_ecs_task_definition" "example" {
  family = "example-task-definition"
  
  container_definitions = jsonencode([
    {
      name      = "example-container"
      image     = "nginx:latest"
      essential = true
      
      # Enable read-only root filesystem
      readonly_root_filesystem = true
      
      # If the container needs to write files, mount a volume
      mount_points = [
        {
          container_path = "/var/cache/nginx"
          source_volume  = "nginx-cache"
        }
      ]
    }
  ])
  
  volumes = [
    {
      name = "nginx-cache"
    }
  ]
}
```

## Resources
- [Amazon ECS Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definitions.html)
- [ECS Task Definition Parameters](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html#container_definition_security)
- [AWS Foundational Security Best Practices - ECS.2](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-2)
