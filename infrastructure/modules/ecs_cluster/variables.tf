variable "env" {
  type = string
  description = "The environment that the cluster will be deployed in"
}

variable "tags" {
  type = map(string)
  description = "tags to add to cluster"
}