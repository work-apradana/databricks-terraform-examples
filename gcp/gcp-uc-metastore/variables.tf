variable "default_tags" {
  type = map(string)
  default = {
    Owner = "aditya_pradana"
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
  prefix = "databricks-${var.databricks_gcp_workspace_id}-${local.alias}-${random_string.naming.result}"
}
