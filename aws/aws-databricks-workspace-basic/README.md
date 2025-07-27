# Databricks Workspace on AWS

This directory contains Terraform code to provision a Databricks workspace and all required AWS infrastructure, including networking, S3 storage, IAM roles, and VPC endpoints. It takes about 4-5minutes for the deployment to complete.

## What This Module Does

- **Creates a secure AWS VPC** with public and private subnets, NAT gateway, and security groups.
- **Sets up VPC endpoints** for S3, STS, and Kinesis to enable private connectivity from Databricks. All 3 endpoints are recommended for production, but if you are developing/testing, S3 Gateway should be sufficient. 
- **Provisions S3 buckets** for Databricks root storage with encryption and public access blocking.
- **Configures IAM roles and policies** for Databricks cross-account access.
- **Deploys Databricks workspace** using the MWS (multi-workspace) API.

## Files Overview

- `aws-vpc.tf`: Defines the VPC, subnets, and security groups.
- `aws-vpc-endpoints.tf`: Provisions VPC endpoints for S3, STS, and Kinesis.
- `aws-s3.tf`: Creates and configures the S3 bucket for Databricks root storage.
- `aws-iam-role.tf`: Sets up IAM roles and policies for Databricks access.
- `dbx-workspace.tf`: Provisions the Databricks workspace and supporting resources.
- `variables.tf`: Input variables for customizing the deployment. Variables are further breakdown into subfiles to indicate where they belong.
- `outputs.tf`: Useful outputs such as workspace URL.
- `main.tf`: Intentionally left empty for future submodule-based deployment.

## Usage

1. **Configure your AWS credentials using AWS CLI Profile** (e.g., via environment variables or AWS CLI).
    - This guide assumes you configure credentials using [AWS IAM Identity Center method](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-sso.html).
2. **Customize variables** in `terraform.tfvars` or via the `variables.tf` file. Example provided in `sample.terraform.tfvars`
3. **Initialize Terraform**:
   ```
   terraform init
   ```
4. **Plan and apply**:
   ```
   terraform plan
   terraform apply
   ```

## Notes

- This module is designed for AWS accounts with Databricks MWS (E2) enabled.
- The S3 bucket is created with encryption and public access blocked by default.
- IAM roles are provisioned for secure cross-account access by Databricks.
- VPC endpoints are optional. Deploying VPC endpoints may incur hourly and bandwidth cost. S3 Gateway endpoint is recommended to minimize public egress cost.

## References

- [Databricks AWS Workspace Deployment Guide with Terraform](https://docs.databricks.com/aws/en/admin/workspace/templates#terraform)
