## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| branch\_name | The branch that the pipeline runs | `string` | n/a | yes |
| buildspec\_location | location of buildspec | `string` | n/a | yes |
| ecs\_service\_name | The name of the ECS service | `string` | n/a | yes |
| env | The environment of the pipeline | `string` | n/a | yes |
| github\_secret | Github secret to access code | `string` | n/a | yes |
| pipeline\_name | The name for reousrces in the pipeline | `string` | n/a | yes |
| repository\_name | The name of the repo that the pipeline will pull from | `string` | n/a | yes |
| tags | A list of tags attached to the pipeline resources | `map(string)` | n/a | yes |

## Outputs

No output.

