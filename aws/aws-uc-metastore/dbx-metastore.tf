resource "databricks_metastore" "this" {
  provider      = databricks.accounts
  name          = "${local.prefix}-metastore"
  region        = var.aws_region
  force_destroy = true
}

resource "databricks_metastore_assignment" "this" {
  provider     = databricks.accounts
  metastore_id = databricks_metastore.this.id
  workspace_id = var.databricks_workspace_id
}