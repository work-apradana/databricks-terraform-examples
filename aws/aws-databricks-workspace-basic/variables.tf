variable "tags" {
  default = {
    Owner       = "aditya.pradana@databricks.com"
    RemoveAfter = "2025-07-30"
  }
}

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
  alias  = "${var.alias}"
  prefix = "${local.alias}-${random_string.naming.result}-${var.aws_region_id}"
}
