variable "vpc_id" {
  type        = string
  description = "VPC ID where security groups will be attached"
}

variable "environment" {
  type        = string
  description = "Environment identifier"
  default     = "dev"
}
