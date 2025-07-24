# Azure Unity Catalog Metastore

This directory contains code to provision Databricks metastore and associated Azure Storage Account Bucket as Databricks External Location.

## What This Module Does

- **Creates an Access Connector** as connector from Databricks to external storage.
- **Creates a Storage Account & Container** for use as an external location with Unity Catalog.
- **Grants required role assignment** to the access connector for accessing the bucket.
- **Provisions a Databricks metastore** and assigns it to your workspace.
- **Creates a storage credential and external location** in Databricks, referencing the Blob Container.
- **Defines IAM roles and permissions** for Unity Catalog file events.

## Files Overview

- `providers.tf`: Configures required providers.
- `main.tf`: Intentionally left empty for future submodule-based deployment.
- `variables.tf`: Input variables and local values. It is broken down into subfiles to indicate databricks and azure specific variables
- `dbx-metastore.tf`: Databricks metastore, resources.
- `dbx-external-location.tf`: Databricks storage credential, and external location resources.
- `azure-resource-group.tf`: Creates Azure resource groups.
- `azure-storage-accounts.tf`: Creates Azure access connector, storage account, container and roles.

## Notes

- Ensure you have the correct Azure credentials and Databricks profiles set up. User-2-Machine authentication through CLI is used here.
- The IAM roles assigned are the minimum required for Unity Catalog to access Blob Container.

For more details, refer to the official docs for Azure External Location:
- [Creating storage credentials](https://learn.microsoft.com/en-us/azure/databricks/connect/unity-catalog/cloud-storage/storage-credentials).
- [Creating external location](https://learn.microsoft.com/en-us/azure/databricks/connect/unity-catalog/cloud-storage/external-locations)
