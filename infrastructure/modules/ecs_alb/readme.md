## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_security\_group | Security group for ALB. Which traffic is allowed to connect to ALB | `string` | n/a | yes |
| app\_port | The port the application is listening on | `string` | n/a | yes |
| env | Environment that Load Balancer will be associated with | `string` | n/a | yes |
| name | The main of application load balancer that will route traffic to ecs tasks | `string` | n/a | yes |
| private\_subnet\_ids | List of the private subents in the vpc | `list(string)` | n/a | yes |
| tags | Map of tags to associate with ALB | `map(string)` | n/a | yes |
| vpc\_id | The vpc id where resources are being deployed to | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| alb\_arn | ARN of ALB the routes traffics to the different ecs services |
| alb\_dns\_name | The generic dns name that gets created for ALB |
| alb\_lister\_arn | ARN of ALB listener that gets different rules attached to successfully route traffic to ecs services |

