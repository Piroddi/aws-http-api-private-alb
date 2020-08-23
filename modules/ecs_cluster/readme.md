## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | The environment that the cluster will be deployed in | `string` | n/a | yes |
| tags | tags to add to cluster | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| aws\_ecs\_cluster\_id | Id of ECS cluster |
| ecs\_cluster\_name | Name of ECS cluster |

