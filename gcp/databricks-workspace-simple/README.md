

# GCP Databricks Workspace

This directory contains code to provision Databricks workspace in GCP.

## What This Module Does
This module provisions a Databricks workspace on Google Cloud Platform (GCP) using Terraform. It automates the following:
- **Creates a Databricks workspace** in your specified GCP project and region.

## Files Overview
This directory contains the following files:

- `providers.tf`: Configures the required providers.
- `variables.tf`: Input variables and local values.
- `variables-gcp.tf`: GCP-specific variables.
- `variables-dbx.tf`: Databricks-specific variables.
- `main.tf`: Provision the main workspaces using all the default values
- `outputs.tf`: Exposes useful outputs from the module.

## Notes

- Ensure you have the correct GCP credentials and Databricks profiles set up. User-2-Machine authentication through CLI is used here.

For more details, refer to the official docs for GCS External Location:
- [Creating GCP workspace using Terraform](https://docs.databricks.com/gcp/en/admin/workspace/templates).
