# ecs-task-definitions-no-host-process-namespace

## Policy Description
This policy requires that resources of type `awscc_ecs_task_definition` do not share the host's process namespace.

## Policy Requirements
This policy requires that ECS task definitions do not use the host's process namespace by setting `pid_mode` to `"host"`.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [ECS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-3).

## Policy Result (Pass)
```
PASS - policies/ecs/ecs-task-definitions-no-host-process-namespace.sentinel
  PASS - policies/ecs/test/ecs-task-definitions-no-host-process-namespace/success.hcl

    trace:
      ecs-task-definitions-no-host-process-namespace.sentinel:50:1 - Rule "main"
        Value:
          true
```

## Policy Result (Fail)
```
FAIL - policies/ecs/ecs-task-definitions-no-host-process-namespace.sentinel
  FAIL - policies/ecs/test/ecs-task-definitions-no-host-process-namespace/failure.hcl


    logs:
      ECS task definitions that share the host's process namespace:
        * awscc_ecs_task_definition.task_def_with_host_pid
    trace:
      ecs-task-definitions-no-host-process-namespace.sentinel:50:1 - Rule "main"
        Value:
          false
```

## Remediation
To remediate this issue, ensure that your ECS task definitions do not use the host's process namespace:

```hcl
resource "awscc_ecs_task_definition" "example" {
  family = "my-task-family"
  
  # Use "task" instead of "host" for pid_mode
  pid_mode = "task"
  
  container_definitions = [
    {
      name      = "my-container"
      image     = "nginx:latest"
      essential = true
      user      = "nginx"
    }
  ]
}
```

Alternatively, you can omit the `pid_mode` parameter entirely, as it defaults to a non-host value.

## Resources
- [AWS ECS Task Definition Parameters](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/task_definition_parameters.html)
- [AWS Foundational Security Best Practices - ECS.3](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-3)
