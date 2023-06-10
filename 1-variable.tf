variable "project" {
  type        = string
  description = "gcp project id"
  # default     = "<update-here-or-as-TF_VAR_project>"
}

variable "region" {
  type        = string
  description = "selected region"
  default     = "asia-southeast1"
}

variable "zone" {
  type        = string
  description = "selected zone"
  default     = "asia-southeast1-a"
}

variable "proj_name" {
  type        = string
  description = "this project name to be use across"
  default     = "terra-gcp-minikube"
}

variable "vpc_cidr" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/26"
}

# variable "ssh_user" {
#   type        = string
#   description = "ssh user"
#   default     = "wss"
# }

# variable "ssh_pub_key" {
#     type        = string
#     description = "ssh pub key"
#     default     = "<your-pub-key-in-rsa-format>"
# }