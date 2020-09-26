## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| buildspec | The location and name of the codebuild buildspec file | `string` | n/a | yes |
| codebuild\_compute\_type | The EC2 type for codebuild | `string` | n/a | yes |
| codebuild\_image | The docker build image used for codebuild | `string` | n/a | yes |
| codebuild\_project\_name | The name of the codebuild project | `string` | n/a | yes |
| env | The environment of the pipeline | `string` | n/a | yes |
| kms\_key\_arn | The kms arn used to encrpyted the codebuild output artifact | `string` | n/a | yes |
| tags | A list of tags attached to the pipeline resources | `map(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| codebuild\_arn | ARN of codebuild project that builds microservice |
| codebuild\_name | Name of codebuild project that builds microservice |

