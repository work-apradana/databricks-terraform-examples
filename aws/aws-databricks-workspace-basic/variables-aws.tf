variable "aws_region" {
  default = ""
}

variable "aws_region_id" {
  default     = ""
  description = "AWS region ID to be used for the naming convention"
}

variable "aws_profile" {
  default = ""
}

variable "aws_account_id" {
  default     = ""
  description = "(Required) AWS account ID"
}

variable "aws_vpc_config_cidr_block" {
  default = "10.0.0.0/16"
}
