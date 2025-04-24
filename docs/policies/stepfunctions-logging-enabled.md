# StepFunctions.1 Step Functions state machines should have logging turned on

| Provider | Category | Resource | Parameter | Description |
|----------|----------|----------|-----------|-------------|
| awscc | Logging | awscc_stepfunctions_state_machine | logging_configuration | Ensures that AWS Step Functions state machines have logging enabled |

## Description

This policy ensures that AWS Step Functions state machines have logging enabled. Enabling logging for Step Functions state machines provides visibility into state machine execution, which helps with debugging and analyzing the execution flow. Logs are sent to CloudWatch Logs, which allows you to monitor and analyze the execution of your state machines.

## Remediation

To remediate this issue, add logging configuration to your Step Functions state machine:

```hcl
resource "awscc_stepfunctions_state_machine" "example" {
  definition = jsonencode({
    Comment = "A Hello World example of the Amazon States Language using Pass states"
    StartAt = "Hello"
    States = {
      Hello = {
        Type   = "Pass"
        Result = "Hello"
        Next   = "World"
      }
      World = {
        Type   = "Pass"
        Result = "World"
        End    = true
      }
    }
  })
  
  role_arn = "arn:aws:iam::123456789012:role/service-role/StepFunctions-StateMachine-Role"
  state_machine_name = "example-state-machine"
  
  logging_configuration = {
    level = "ALL"
    include_execution_data = true
    log_destination = "arn:aws:logs:us-east-1:123456789012:log-group:/aws/vendedlogs/states/StateMachine-Example:*"
  }
}
```

## Policy Results

### Pass

```
trace:
      stepfunctions-logging-enabled.sentinel:24:1 - Rule "main"
        Description:
          StepFunctions.1 Step Functions state machines should have logging turned on

        Value:
          true
```

### Fail

```
trace:
      stepfunctions-logging-enabled.sentinel:24:1 - Rule "main"
        Description:
          StepFunctions.1 Step Functions state machines should have logging turned on

        Value:
          false
```
