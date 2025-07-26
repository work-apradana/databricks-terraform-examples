variable "azure_subscription_id" {
  default = ""
}

variable "azure_region" {
  default = ""
}

variable "azure_databricks_sku" {
  default     = "premium"
  description = "The pricing tier for Azure Databricks workspace. `premium` | `standard` | `trial`"

}

variable "azure_config_vnet_cidr" {
  default     = "10.0.0.0/16"
  description = "The CIDR block for the Azure Virtual Network"
}

variable "azure_config_no_public_ip" {
  default     = true
  description = "Whether to create a public IP address for the Databricks workspace"
}

variable "create_nat_gateway" {
  default     = true
  description = "Whether to create a NAT gateway for the Databricks workspace"
}