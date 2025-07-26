resource "azurerm_resource_group" "this" {
  name     = "${local.prefix}-parent-rg"
  location = var.azure_region
  tags     = var.default_tags
}