resource "azurerm_databricks_workspace" "this" {
  name                        = "${local.prefix}-workspace"
  resource_group_name         = azurerm_resource_group.this.name
  location                    = azurerm_resource_group.this.location
  sku                         = var.azure_databricks_sku
  managed_resource_group_name = "${local.prefix}-workspace-managed-rg"
  tags                        = var.default_tags

  custom_parameters {
    no_public_ip                                         = var.azure_config_no_public_ip
    virtual_network_id                                   = azurerm_virtual_network.this.id
    private_subnet_name                                  = azurerm_subnet.private.name
    public_subnet_name                                   = azurerm_subnet.public.name
    public_subnet_network_security_group_association_id  = azurerm_subnet_network_security_group_association.public.id
    private_subnet_network_security_group_association_id = azurerm_subnet_network_security_group_association.private.id

    storage_account_name     = local.storage_account_name
    storage_account_sku_name = "Standard_LRS"
  }

  # # other possible options
  # customer_managed_key_enabled = false
  # infrastructure_encryption_enabled = false
  # load_balancer_backend_address_pool_id = null
  # public_network_access_enabled = true
  # network_security_group_rules_required = null
  # default_storage_firewall_enabled = false
  # access_connector_id = null

  # # data encryption
  # managed_disk_cmk_key_vault_id = null
  # managed_services_cmk_key_vault_id = null

  # # security & compliance
  # enhanced_security_compliance {
  #   compliance_security_profile_enabled = false
  #   compliance_security_profile_standards = null
  #   enhanced_security_monitoring_enabled = false
  #   automatic_cluster_update_enabled = false
  # }

}



