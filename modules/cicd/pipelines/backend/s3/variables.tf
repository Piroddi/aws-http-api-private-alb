variable "s3_bucket_name" {
  type = string
}

variable "env" {
  type = string
  description = "The environment of the pipeline"
}

variable "tags" {
  type = map(string)
  description = "A list of tags attached to the pipeline resources"
}