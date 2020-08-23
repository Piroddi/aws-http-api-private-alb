## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | The environment of the pipeline | `string` | n/a | yes |
| s3\_bucket\_name | n/a | `string` | n/a | yes |
| tags | A list of tags attached to the pipeline resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| s3\_bucket\_id | Id of S3 bucket that's used in pipeline to store artifacts |

