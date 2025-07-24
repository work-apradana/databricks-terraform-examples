# GCP Unity Catalog Metastore


This directory contains code to provision Databricks metastore and associated GCS (Google Cloud Storage) Bucket as Databricks External Location.

## What This Module Does

- **Creates a GCS bucket** for use as an external location with Unity Catalog.
- **Grants required IAM roles** to the Databricks-managed service account for accessing the bucket.
- **Provisions a Databricks metastore** and assigns it to your workspace.
- **Creates a storage credential and external location** in Databricks, referencing the GCS bucket.
- (Optionally but recommended) **Defines IAM roles and permissions** for Unity Catalog file events.

## Files Overview

- `providers.tf`: Configures required providers.
- `variables.tf`: Input variables and local values.
- `dbx-metastore.tf`: Databricks metastore, assignment, storage credential, and external location resources.
- `gcp-gcs.tf`: GCS bucket and IAM bindings for Databricks service account.
- `gcp-gcs-fileevent.tf`: (Commented) Optional resources for file event integration.

## Notes

- Ensure you have the correct GCP credentials and Databricks profiles set up. User-2-Machine authentication through CLI is used here.
- The IAM roles assigned are the minimum required for Unity Catalog to access GCS.

For more details, refer to the official docs for GCS External Location:
- [Creating storage credentials](https://docs.databricks.com/gcp/en/connect/unity-catalog/cloud-storage/storage-credentials).
- [Creating external location](https://docs.databricks.com/gcp/en/connect/unity-catalog/cloud-storage/external-locations)
