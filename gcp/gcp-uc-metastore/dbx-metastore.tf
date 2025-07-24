resource "databricks_metastore" "this" {
  provider      = databricks.accounts
  name          = "${local.prefix}-metastore"
  region        = var.gcp_region
  force_destroy = true
}

resource "databricks_metastore_assignment" "this" {
  provider             = databricks.accounts
  workspace_id         = var.databricks_gcp_workspace_id
  metastore_id         = databricks_metastore.this.id
}

resource "databricks_storage_credential" "this" {
    provider = databricks.workspace
    name = "${local.prefix}-storage-credential"
    databricks_gcp_service_account {}
    depends_on = [
        databricks_metastore_assignment.this
    ]
}

resource "databricks_external_location" "this" {
    provider = databricks.workspace
    name     = "${local.prefix}-external-location"
    url      = "gs://${google_storage_bucket.ext_bucket.name}/"

    credential_name = databricks_storage_credential.this.id

    comment = "Managed by TF"
    depends_on = [
        databricks_metastore_assignment.this,
        google_storage_bucket_iam_member.gcs_reader,
        google_storage_bucket_iam_member.gcs_admin
    ]
}
