variable "azure_subscription_id" {
  default = ""
}

variable "azure_region" {
  default = ""
}

variable "azure_databricks_sku" {
  default = "premium"
  description = "The pricing tier for Azure Databricks workspace. `premium` | `standard` | `trial`"
}

variable "vnet_address_prefix" {
  default = "10.10"
  description = "The address prefix for the virtual network. First 2 number space in CIDR notation."

  # validation {
  #   condition     = can(regex("^\\d+\\.\\d+$", var.ip_prefix))
  #   error_message = "The value must be in the format 'number.number', like '10.10'."
  # }
}