variable "env" {
  type = string
  description = "The environment of the pipeline"
}
variable "kms_key_name" {
  type = string
  description = "The KMS key name used to encrpyted all resources as part of the pipeline"
}