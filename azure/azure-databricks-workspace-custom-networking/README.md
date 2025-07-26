# Azure Databricks Workspace (Custom-Networking)

This directory contains Terraform code to deploy an Azure Databricks workspace with custom virtual network (VNet) injection. The module provisions all bare-minimum necessary Azure resources, including a resource group, a VNet, subnets, and a Databricks workspace configured to use your custom network settings. This setup is suitable for scenarios where you require more control over network security, routing, and integration with other Azure services.

Note that this customized networking focuses on the Vnet component. There is no CMK (Customer Managed Key), PrivateLink (No public internet connectivity), or Enhanced compliance monitoring being enabled yet.

## What This Module Does

This module automates the following tasks:
- **Creates an Azure Resource Group** in your specified Azure subscription.
- **Creates a custom Virtual Network (VNet) and subnets** for Databricks workspace deployment.
- **Creates a NAT Gateway** and associate it with your public subnet.
- **Deploys an Azure Databricks workspace** with VNet injection enabled, using the custom network.
- **Outputs the Workspace Host URL** for easy access.

## Files Overview

- `providers.tf`: Configures required providers.
- `main.tf`: Intentionally left empty for future submodule-based deployment.
- `outputs.tf`: Exposes the Databricks workspace URL.
- `variables.tf`: Input variables for customization. It is broken down into subfiles to indicate databricks and azure specific variables
- `azure-resource-group.tf`: Deploy Azure resource groups.
- `azure-network.tf`: Deploy custom Azure Vnet.
- `azure-dbx-workspaces.tf`: Deploy Azure Databricks Workspaces.

## Notes

This example is intended for demonstration and testing purposes. For production deployments, review and adjust resource settings as needed.
