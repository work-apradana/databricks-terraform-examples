# Azure Databricks Workspace Examples

This directory contains example Terraform configurations for deploying Databricks workspaces and related resources on **Microsoft Azure**. These examples are designed to help you quickly get started with Databricks on Azure using Infrastructure as Code (IaC) best practices.

## Directory Structure

Each subfolder in this directory provides a focused example for a specific Azure Databricks deployment scenario:

- **`azure-databricks-workspace-basic/`**  
  Deploys a simple Databricks workspace in Azure with default settings and managed VNet. Ideal for quick starts and testing. You can customize the managed Vnet's CIDR prefix and NAT Gateway & NAT GW's public IP name.

- **`azure-databricks-workspace-custom-networking/`**  
  Deploys a Databricks workspace in Azure with custom VNet injection, allowing you to control networking, subnets, and NAT Gateway configuration. Use this if you want more granular control over security & networking of your Vnet.

- **`azure-uc-metastore/`**  
  Deploys a unity catalog metastore and the underlying ADLS object storage. It then assigns the metastore to your preferred workspace. This example assumes that you have deployed a workspace.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) installed and authenticated (`az login`)
- [Databricks CLI](https://docs.databricks.com/en/dev-tools/cli/index.html) (optional, for workspace management)