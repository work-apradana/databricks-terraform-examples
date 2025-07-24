resource "databricks_storage_credential" "this" {
  provider = databricks.workspace
  name     = "${local.prefix}-storage-credential"
  azure_managed_identity {
    access_connector_id = azurerm_databricks_access_connector.this.id
  }
  comment = "Managed by TF"
  depends_on = [
    databricks_metastore_assignment.this
  ]
}

resource "databricks_external_location" "this" {
  provider = databricks.workspace
  name     = "${local.prefix}-external-location"
  url = format(
    "abfss://%s@%s.dfs.core.windows.net",
    azurerm_storage_container.storage_container.name,
    azurerm_storage_account.storage.name
  )
  credential_name = databricks_storage_credential.this.id
  comment         = "Managed by TF"
  depends_on = [
    databricks_metastore.this
  ]
}
