## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_listner\_arn | The arn of the alb listener. Ecs service will attach target group to this listener | `string` | n/a | yes |
| alb\_route\_path | The path used on alb listener rule to route traffic to correct microservice. Microservice cant run as root context '/' | `string` | n/a | yes |
| app\_image | The ecr docker image uri for the microservice | `string` | n/a | yes |
| app\_port | The port number microservice is listening on. | `number` | n/a | yes |
| cluster\_name | Name of ecs cluster where microservices will be deployed | `string` | n/a | yes |
| ecs\_max\_tasks | Maximum number if containers running for microservice | `number` | n/a | yes |
| ecs\_min\_tasks | Minimum number if containers running for microservice | `number` | n/a | yes |
| ecs\_security\_group\_id | Security group for ALB. Which traffic is allowed to connect to ALB | `string` | n/a | yes |
| env | The environment where microservice is being deployed | `string` | n/a | yes |
| fargate\_cpu | The amount of cpu to attach to microservice | `number` | n/a | yes |
| fargate\_memory | The amount of memory needed for microservice. Values must match equivalent cpu value | `number` | n/a | yes |
| name | The name of the microservice | `string` | n/a | yes |
| private\_subnet\_ids | List of the private subents in the vpc | `list(string)` | n/a | yes |
| tags | List of tags to attach to microservice resources | `map(string)` | n/a | yes |
| vpc\_cidr\_block | Cidr range for the selected vpc | `string` | n/a | yes |
| vpc\_id | The vpc\_id of the deployment environment | `string` | n/a | yes |

## Outputs

No output.

