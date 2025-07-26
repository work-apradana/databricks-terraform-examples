resource "azurerm_public_ip" "nat_ip" {
  count = var.create_nat_gateway ? 1 : 0

  name                = "${local.prefix}-natgw-public-ip"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.this.name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.default_tags
}

resource "azurerm_nat_gateway" "nat_gw" {
  count = var.create_nat_gateway ? 1 : 0

  name                = "${local.prefix}-natgw"
  location            = var.azure_region
  resource_group_name = azurerm_resource_group.this.name
  sku_name            = "Standard"
  tags                = var.default_tags
}

resource "azurerm_nat_gateway_public_ip_association" "this" {
  count = var.create_nat_gateway ? 1 : 0

  nat_gateway_id       = azurerm_nat_gateway.nat_gw[0].id
  public_ip_address_id = azurerm_public_ip.nat_ip[0].id
}

resource "azurerm_subnet_nat_gateway_association" "public" {
  count = var.create_nat_gateway ? 1 : 0

  subnet_id      = azurerm_subnet.public.id
  nat_gateway_id = azurerm_nat_gateway.nat_gw[0].id
}