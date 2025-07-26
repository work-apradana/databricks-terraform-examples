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

  network_id = databricks_mws_networks.this.network_id

  depends_on = [google_compute_router_nat.nat]
}

resource "databricks_mws_networks" "this" {
  provider     = databricks.accounts
  account_id   = var.databricks_gcp_account_id
  network_name = "${local.prefix}-mws-network"

  gcp_network_info {
    network_project_id = var.gcp_project_id
    vpc_id             = google_compute_network.vpc.name
    subnet_id          = google_compute_subnetwork.private_subnet.name
    subnet_region      = google_compute_subnetwork.private_subnet.region
  }
}