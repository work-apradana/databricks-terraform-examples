variable "default_tags" {
  type = map(string)
  default = {
    Owner       = "aditya.pradana@databricks.com"
    RemoveAfter = "2025-12-30"
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
  alias = "${var.alias}"
  prefix = "${local.alias}-${random_string.naming.result}"
  storage_account_name = "${alias}${random_string.naming.result}extstorage"
}
