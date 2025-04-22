# ECS clusters have Container Insights enabled

| Provider            | Category |
|---------------------|----------|
| Amazon Web Services | Monitoring |

## Foundational Security Best practices covered with this policy

| Version | Included |
|---------|----------|
| [ECS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-1)   | &check;  |

## Policy Result (Pass)
```
→ → Overall Result: true
```

## Policy Result (Fail)
```
→ → Overall Result: false

ECS clusters without Container Insights enabled:
  * awscc_ecs_cluster.cluster_without_insights
  * awscc_ecs_cluster.cluster_with_disabled_insights
```

## Remediation
To remediate this issue, ensure that Container Insights is enabled for all ECS clusters:

```hcl
resource "awscc_ecs_cluster" "example" {
  cluster_name = "example-cluster"
  
  # Enable Container Insights
  cluster_settings {
    name  = "containerInsights"
    value = "enabled"
  }
}
```

## Resources
- [Amazon ECS Documentation](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/ECS_clusters.html)
- [Amazon ECS CloudWatch Container Insights](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/cloudwatch-container-insights.html)
- [AWS Foundational Security Best Practices - ECS.1](https://docs.aws.amazon.com/securityhub/latest/userguide/securityhub-standards-fsbp-controls.html#fsbp-ecs-1)
