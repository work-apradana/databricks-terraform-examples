resource "databricks_storage_credential" "this" {
  provider     = databricks.workspaces
  metastore_id = databricks_metastore.this.id
  name         = "${local.prefix}-storage-creds"
  aws_iam_role {
    # use predefined role to avoid circular dependency since
    # external_id of storage credential is needed for the IAM role itself
    role_arn = local.iam_role_arn
  }
  force_destroy = true
  comment       = "Managed by TF"
  depends_on = [
    databricks_metastore_assignment.this
  ]
}

resource "databricks_external_location" "this" {
  provider        = databricks.workspaces
  name            = "${local.prefix}-external-location"
  url             = "s3://${aws_s3_bucket.this.id}"
  credential_name = databricks_storage_credential.this.id
  comment         = "Managed by TF"
  depends_on = [
    databricks_metastore_assignment.this,
    aws_iam_role.external_data_access,
    aws_iam_role_policy_attachment.external_data_access,
    time_sleep.wait_role_creation
  ]
}
