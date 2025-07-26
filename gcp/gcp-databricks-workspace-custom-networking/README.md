# GCP Databricks Workspace (Custom-Networking)

This directory contains Terraform code to deploy a Databricks workspace on Google Cloud Platform (GCP) with custom networking. The module provisions all bare-minimum necessary GCP resources, including a VPC network, subnets, and a Databricks workspace configured to use your custom network settings. This setup is suitable for scenarios where you require more control over network security, routing, and integration with other GCP services.

Note that this customized networking focuses on the VPC component. There is no CMEK (Customer Managed Encryption Key), Private Service Connect (No public internet connectivity), or enhanced compliance monitoring being enabled yet.

## What This Module Does

This module automates the following tasks:
- **Creates a custom VPC network and subnets** for Databricks workspace deployment.
- **Deploys a Databricks workspace** with custom network configuration in your specified GCP project and region.
- **Outputs the Workspace Host URL** for easy access.

## Files Overview

- `providers.tf`: Configures required providers.
- `main.tf`: Intentionally left empty for future submodule-based deployment.
- `dbx-workspace.tf`: Deploy Databricks Workspace with custom networking
- `gcp-network.tf`: Deploy the underlying GCP networking including VPC, subnets, router, and NAT.
- `outputs.tf`: Exposes the Databricks workspace URL.
- `variables.tf`: Input variables for customization. It is broken down into subfiles to indicate Databricks and GCP specific variables.
- `variables-gcp.tf`: GCP-specific variables.
- `variables-dbx.tf`: Databricks-specific variables.

## Notes

This example is intended for demonstration and testing purposes. For production deployments, review and adjust resource settings as needed.
