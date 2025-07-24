resource "azurerm_resource_group" "rg" {
  name     = "${local.prefix}-rg-metastore"
  location = "Southeast Asia"
  tags     = var.default_tags
}