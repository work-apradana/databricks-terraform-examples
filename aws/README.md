# AWS Databricks Workspace Examples

This directory contains example Terraform configurations for deploying Databricks workspaces and related resources on **Amazon Web Services (AWS)**. These examples are designed to help you quickly get started with Databricks on AWS using Infrastructure as Code (IaC) best practices.

## Directory Structure

Each subfolder in this directory provides a focused example for a specific AWS Databricks deployment scenario:

- **`aws-databricks-workspace-basic/`**  
  Deploys a basic Databricks workspace in AWS with default settings. Ideal for quick starts and testing. Networking-wise, it will deploy a VPC, subnets, NAT Gateway, and VPC interface endpoint for Kinesis, STS, and Gateway endpoint for S3.

- **`aws-uc-metastore/`**  
  Deploys a unity catalog metastore and the underlying S3 object storage. It then assigns the metastore to your preferred workspace. This example assumes that you have deployed a workspace.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) installed
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) installed and authenticated
- [Databricks CLI](https://docs.databricks.com/en/dev-tools/cli/index.html) (optional, for workspace management)

