## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| env | The environment of the pipeline | `string` | n/a | yes |
| kms\_key\_name | The KMS key name used to encrpyted all resources as part of the pipeline | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| kms\_key\_arn | ARN of KMS key used to encrypt pipelines S3 bucket |

