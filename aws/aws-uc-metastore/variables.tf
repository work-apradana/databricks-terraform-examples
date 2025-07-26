variable "tags" {
  default = {
    Owner       = "aditya.pradana@databricks.com"
    RemoveAfter = "2025-07-30"
  }
}

//generate a random string as the prefix for AWS resources, to ensure uniqueness
resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

variable "alias" {
  type = string
  default = "my_username"
  description = "Your personal alias, name, initials, or identifier"
}

locals {
  alias         = "${var.alias}"
  prefix        = "${local.alias}-${random_string.naming.result}-${var.aws_region_id}"
  iam_role_name = "${local.prefix}-metastore-access-role"
  iam_role_arn  = "arn:aws:iam::${var.aws_account_id}:role/${local.iam_role_name}"
}

# variable "unity_metastore_owner" {
#   description = "(Required) Name of the principal that will be the owner of the Metastore"
#   type        = string
#   default     = "apradana-principals-group"
# }

# variable "metastore_name" {
#   description = "(Optional) Name of the metastore that will be created"
#   type        = string
#   default     = null
# }
