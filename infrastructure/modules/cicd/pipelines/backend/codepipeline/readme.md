## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| S3\_bucket\_name | The s3 bucket name to store the pipeline artifacts | `string` | n/a | yes |
| branch\_name | The branch on the repo to build | `string` | n/a | yes |
| codebuild\_project\_name | The name of the codebuild project to be add to the pipeline | `string` | n/a | yes |
| codepipeline\_name | The name of the codepipeline project | `string` | n/a | yes |
| ecs\_service\_name | The name of the ECS service | `string` | n/a | yes |
| env | The environment of the pipeline | `string` | n/a | yes |
| github\_org | The github account name | `string` | n/a | yes |
| github\_token | The personal token from github with access to the repo name | `string` | n/a | yes |
| kms\_key\_arn | The kms arn used to encrpyted the codebuild output artifact | `string` | n/a | yes |
| repository\_name | The repo name for the pipeline | `string` | n/a | yes |
| tags | A list of tags attached to the pipeline resources | `map(string)` | n/a | yes |

## Outputs

No output.

