resource "azurerm_databricks_access_connector" "this" {
  name                = "${local.prefix}-access-connector"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  identity {
    type = "SystemAssigned"
  }

  tags = var.default_tags
}

resource "azurerm_storage_account" "storage" {
  name                            = "${local.storage_account_name}"
  resource_group_name             = azurerm_resource_group.rg.name
  location                        = azurerm_resource_group.rg.location
  account_tier                    = "Standard"
  account_replication_type        = "LRS"
  is_hns_enabled                  = true # This enables ADLS Gen2
  allow_nested_items_to_be_public = false

  tags = var.default_tags
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "${local.prefix}-container"
  storage_account_id    = azurerm_storage_account.storage.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "storage_account_assignment" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Account Contributor"
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "storage_blob_assignment" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "storage_queue_assignment" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Queue Data Contributor"
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}

resource "azurerm_role_assignment" "storage_eventgrid_assignment" {
  scope                = azurerm_resource_group.rg.id
  role_definition_name = "EventGrid EventSubscription Contributor"
  principal_id         = azurerm_databricks_access_connector.this.identity[0].principal_id
}