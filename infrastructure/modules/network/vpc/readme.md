## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| availability\_zones | List of availability zones for the selected region | `list(string)` | n/a | yes |
| env | Application environment | `string` | n/a | yes |
| number\_of\_private\_subnets | The number of private subnets in a VPC | `number` | `2` | no |
| private\_subnet\_cidr\_blocks | CIDR block range for the private subnets | `list(string)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.4.0/24"<br>]</pre> | no |
| private\_subnet\_tag\_name | Name tag for the private subnet | `string` | n/a | yes |
| tags | Map of tags to attach to network resources | `map(string)` | n/a | yes |
| vpc\_cidr\_block | CIDR block range for vpc | `string` | `"10.0.0.0/16"` | no |
| vpc\_tag\_name | Name tag for the VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| alb\_sg | Security group that will get attached to the ALB |
| ecs\_taks\_sg | Security group that will get attached to the ecs tasks |
| private\_subnet\_ids | Id's of newly created subents for vpc |
| vpc\_arn | ARN of newly created vpc |
| vpc\_cidr | cidr range fot new vpc |
| vpc\_id | Id of newly created vpc |

