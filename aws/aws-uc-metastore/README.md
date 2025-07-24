# Databricks Unity Catalog Metastore on AWS

This directory contains code to provision a Databricks Metastore and all required AWS infrastructure, including S3 storage, IAM roles, and policies for secure data governance.

## What This Module Does

- **Creates an S3 bucket** for Unity Catalog managed storage with encryption and public access blocking.
- **Configures IAM roles and policies** for Databricks to access the S3 bucket securely.
- **Provisions the Databricks Metastore** and assigns the required AWS IAM role.
- **(Optionally) configures workspace assignment** to the metastore.
- **Create storage credentials and external locations** under the metastore.

## Files Overview

- `aws-s3.tf`: Creates and configures the S3 bucket for Unity Catalog managed storage.
- `aws-iam-role.tf`: Sets up IAM roles and policies for Databricks Unity Catalog access.
- `dbx-metastore.tf`: Provisions the Unity Catalog Metastore and workspace assignment.
- `dbx-external-locations.tf`: Provisions the Unity Catalog Metastore and workspace assignment.
- `variables.tf`: Input variables for customizing the deployment. Variables are further breakdown into subfiles to indicate where they belong.
- `outputs.tf`: Useful outputs such as metastore ID, bucket name, and role ARN.
- `main.tf`: Intentionally left empty for future submodule-based deployment.

## Usage

1. **Configure your AWS credentials** (e.g., via environment variables or AWS CLI).
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

- This module is designed for AWS accounts with Databricks MWS (E2) and Unity Catalog enabled.
- The S3 bucket is created with encryption and public access blocked by default.
- You must have the Databricks Account Admin role to create a Unity Catalog Metastore.
- Time sleep during IAM role creation is needed to work around the delay when creating IAM role

## Troubleshooting:
- If you encounter `metastore_id must be empty...`, please refer [here](https://registry.terraform.io/providers/databricks/databricks/latest/docs/guides/troubleshooting#error-updating-uc-catalog-resources-after-a-metastore_id-change). This usually happens if you destroy and recreate resources too fast. Try to wait around ~5-7 minutes after destroying before recreating. Check if metastore assignment is still there using `databricks --profile <profile-name> metastores current`

## References

- [Databricks Storage Credentials](https://docs.databricks.com/aws/en/connect/unity-catalog/cloud-storage/storage-credentials)
- [Databricks External Locations](https://docs.databricks.com/aws/en/connect/unity-catalog/cloud-storage/external-locations)

