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

locals {
  alias = "<your-alias-or-id"
  prefix = "databricks-${var.databricks_gcp_workspace_id}-${local.alias}-${random_string.naming.result}"
}
