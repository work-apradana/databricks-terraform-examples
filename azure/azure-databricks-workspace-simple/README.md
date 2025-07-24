# Azure Databricks Workspace (Simple)

This directory contains code to deploy a simple Azure Databricks workspace without Vnet injection. It uses all the default values. If everything is fine it will take about 5-6 minutes to deploy.

## What This Module Does
This module provisions a Databricks workspace on Microsoft Azure (GCP) using Terraform. It automates the following:
- **Creates an Azure Resource Group** in your specified Azure subscription.
- **Creates a Databricks workspace** in your specified Azure subscription and resource group.
- **Outputs the Workspace Host URL**


## Files Overview

- `main.tf`: Defines the Databricks workspace and required Azure resources.
- `outputs.tf`: Exposes the Databricks workspace URL.
- `variables.tf`: Input variables for customization.

## Notes

This example is intended for demonstration and testing purposes. For production deployments, review and adjust resource settings as needed.
