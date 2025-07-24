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