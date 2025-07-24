
variable "aws_region" {
  default = ""
}

variable "aws_region_id" {
  default = ""
  description = "AWS region ID to be used for the naming convention"
}

variable "aws_profile" {
  default = ""
}

variable "aws_account_id" {
  type        = string
  description = "(Required) AWS account ID"
}
