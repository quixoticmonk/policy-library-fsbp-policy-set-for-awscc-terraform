# ecs-clusters-container-insights

## Policy Description
This policy requires that resources of type `awscc_ecs_cluster` have Container Insights enabled.

## Policy Requirements
This policy requires that ECS clusters have Container Insights enabled through the `cluster_settings` configuration.

## AWS Foundational Security Best Practices
This policy relates to the AWS Foundational Security Best Practice control [ECS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-1).

## Policy Result (Pass)
```
PASS - policies/ecs/ecs-clusters-container-insights.sentinel
  PASS - policies/ecs/test/ecs-clusters-container-insights/success.hcl

    trace:
      ecs-clusters-container-insights.sentinel:67:1 - Rule "main"
        Value:
          true
```

## Policy Result (Fail)
```
FAIL - policies/ecs/ecs-clusters-container-insights.sentinel
  FAIL - policies/ecs/test/ecs-clusters-container-insights/failure.hcl


    logs:
      ECS clusters without Container Insights enabled:
        * awscc_ecs_cluster.cluster_without_insights
        * awscc_ecs_cluster.cluster_with_disabled_insights
    trace:
      ecs-clusters-container-insights.sentinel:67:1 - Rule "main"
        Value:
          false
```

## Remediation
To remediate this issue, ensure that Container Insights is enabled for your ECS clusters:

```hcl
resource "awscc_ecs_cluster" "example" {
  cluster_name = "my-cluster"
  
  cluster_settings {
    name  = "containerInsights"
    value = "enabled"
  }
}
```

## Resources
- [AWS ECS Container Insights Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html)
- [AWS Foundational Security Best Practices - ECS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/ecs-controls.html#ecs-1)
