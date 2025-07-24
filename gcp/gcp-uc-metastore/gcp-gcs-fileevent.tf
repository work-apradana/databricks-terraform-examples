# File Events role are recommended but not compulsory

resource "google_project_iam_custom_role" "uc_file_events" {
  role_id     = "ucFileEvents"
  title       = "Unity Catalog file events role"
  permissions = [
    "pubsub.subscriptions.consume",
    "pubsub.subscriptions.create",
    "pubsub.subscriptions.delete",
    "pubsub.subscriptions.get",
    "pubsub.subscriptions.list",
    "pubsub.subscriptions.update",
    "pubsub.topics.attachSubscription",
    "pubsub.topics.create",
    "pubsub.topics.delete",
    "pubsub.topics.get",
    "pubsub.topics.list",
    "pubsub.topics.update",
    "storage.buckets.update"
  ]
}

data "google_storage_project_service_account" "gcs_sa" {}

resource "google_project_iam_member" "uc_project_file_events_admin" {
  project = var.gcp_project_id
  role    = google_project_iam_custom_role.uc_file_events.id
  member  = "serviceAccount:${databricks_storage_credential.this.databricks_gcp_service_account[0].email}"
}

resource "google_project_iam_member" "cloud_storage_sa_pubsub_publisher" {
  project = var.gcp_project_id
  role  = "roles/pubsub.publisher"
  member = "serviceAccount:${data.google_storage_project_service_account.gcs_sa.email_address}"
}
