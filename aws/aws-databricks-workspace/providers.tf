terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.85.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "5.30.0"
    }

    time = {
      source  = "hashicorp/time"
      version = "0.13.1"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

# initialize provider in "Accounts" mode for account-level control
provider "databricks" {
  alias   = "accounts"
  profile = var.databricks_aws_account_profile
}
