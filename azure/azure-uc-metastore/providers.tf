terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.85.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.35.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.azure_subscription_id
}

provider "databricks" {
  alias   = "workspace"
  profile = var.databricks_azure_workspace_profile
}

provider "databricks" {
  alias   = "accounts"
  profile = var.databricks_azure_account_profile
}
