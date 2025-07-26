resource "databricks_mws_workspaces" "this" {
  provider       = databricks.accounts
  account_id     = var.databricks_gcp_account_id
  workspace_name = "${local.prefix}-gcp-ws"
  location       = var.gcp_region

  cloud_resource_container {
    gcp {
      project_id = var.gcp_project_id
    }
  }
}

