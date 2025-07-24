terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.85.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "6.42.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "google" {
  project     = var.gcp_project_id
  region      = var.gcp_region
  credentials = file(var.gcp_credentials_path)
}

provider "databricks" {
  alias   = "workspace"
  profile = var.databricks_gcp_workspace_profile
}

provider "databricks" {
  alias   = "accounts"
  profile = var.databricks_gcp_account_profile
}
