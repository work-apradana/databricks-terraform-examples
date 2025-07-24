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
  prefix = "databricks-${var.databricks_gcp_workspace_id}-apradana-${random_string.naming.result}"
}
