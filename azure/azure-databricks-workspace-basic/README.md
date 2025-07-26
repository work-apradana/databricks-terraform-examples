# Azure Databricks Workspace (Simple)

This directory contains code to deploy a simple Azure Databricks workspace without Vnet injection. It uses all the default values. If everything is fine it will take about 5-6 minutes to deploy.

## What This Module Does
This module provisions a Databricks workspace on Microsoft Azure using Terraform. It automates the following:
- **Creates an Azure Resource Group** in your specified Azure subscription.
- **Creates a Databricks workspace** in your specified Azure subscription and resource group with default managed Vnet settings.
  - You can optionally configure Vnet CIDR prefix and NAT Gateway & NAT GW's public IP name.
- **Outputs the Workspace Host URL**


## Files Overview

- `providers.tf`: Configures required providers.
- `main.tf`: Intentionally left empty for future submodule-based deployment.
- `outputs.tf`: Exposes the Databricks workspace URL.
- `variables.tf`: Input variables for customization. It is broken down into subfiles to indicate databricks and azure specific variables
- `azure-resource-group.tf`: Deploy Azure resource groups.
- `azure-dbx-workspaces.tf`: Deploy Azure Databricks Workspaces.

## Notes

This example is intended for demonstration and testing purposes. For production deployments, review and adjust resource settings as needed.
