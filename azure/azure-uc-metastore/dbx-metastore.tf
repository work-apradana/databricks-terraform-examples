resource "databricks_metastore" "this" {
  provider      = databricks.accounts
  name          = "${local.prefix}-metastore"
  region        = azurerm_resource_group.rg.location
  force_destroy = true
}

resource "databricks_metastore_assignment" "this" {
  provider     = databricks.accounts
  workspace_id = data.azurerm_databricks_workspace.this.workspace_id
  metastore_id = databricks_metastore.this.id
}

data "azurerm_databricks_workspace" "this" {
  name                = "<your-workspace-name>"
  resource_group_name = "<your-workspace-resource-group>"
}