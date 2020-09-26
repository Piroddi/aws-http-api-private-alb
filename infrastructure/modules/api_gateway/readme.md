## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| alb\_lister\_arn | The arn of the Application load balancer to route requests to | `string` | n/a | yes |
| env | The http api environment | `string` | n/a | yes |
| name | The name of the Api Gateway http api | `string` | n/a | yes |
| private\_subnets | List of private subnets to attach to vpc link | `list(string)` | n/a | yes |
| route53\_domain | The Route53 main, that will be attached to api gateway with subdomain of api. | `string` | n/a | yes |
| tags | Map of tags to associated with api gateway | `map(string)` | n/a | yes |
| vpc\_link\_sg\_ids | List of security groups, that control access throug the VPC link | `string` | n/a | yes |

## Outputs

No output.

