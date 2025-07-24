resource "azurerm_databricks_workspace" "this" {
  name                        = "${local.prefix}-workspace"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = var.azure_databricks_sku
  managed_resource_group_name = "${local.prefix}-workspace-managed-rg"
  tags                        = var.default_tags

  # custom_parameters {}
}