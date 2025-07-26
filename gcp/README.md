# GCP Databricks Workspace Examples

This directory contains example Terraform configurations for deploying Databricks workspaces and related resources on **Google Cloud Platform (GCP)**. These examples are designed to help you quickly get started with Databricks on GCP using Infrastructure as Code (IaC) best practices.

## Directory Structure

Each subfolder in this directory provides a focused example for a specific GCP Databricks deployment scenario:

- **`gcp-databricks-workspace-basic/`**  
  Deploys a basic Databricks workspace in GCP with default settings. Ideal for quick starts and testing. Networking-wise, it will deploy a VPC, subnets, and required service accounts.

- **`gcp-databricks-workspace-custom-networking/`**  
  Deploys a basic Databricks workspace in GCP with custom networking, allowing you to control networking, subnets, and NAT Gateway configuration. Use this if you want more granular control over security & networking of your VPC.

- **`gcp-uc-metastore/`**  
  Deploys a unity catalog metastore and the underlying GCS bucket. It then assigns the metastore to your preferred workspace. This example assumes that you have deployed a workspace.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [gcloud CLI](https://cloud.google.com/sdk/docs/install) installed and authenticated (`gcloud auth application-default login` or service account key)
- [Databricks CLI](https://docs.databricks.com/en/dev-tools/cli/index.html) (optional, for workspace management)
