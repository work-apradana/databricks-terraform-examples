### These below are recommended but not compulsory

# # This defines the role for Unity Catalog file events
# resource "google_project_iam_custom_role" "uc_file_events" {
#   role_id     = "ucFileEvents"
#   title       = "Unity Catalog file events role"
#   permissions = [
#     "pubsub.subscriptions.consume",
#     "pubsub.subscriptions.create",
#     "pubsub.subscriptions.delete",
#     "pubsub.subscriptions.get",
#     "pubsub.subscriptions.list",
#     "pubsub.subscriptions.update",
#     "pubsub.topics.attachSubscription",
#     "pubsub.topics.create",
#     "pubsub.topics.delete",
#     "pubsub.topics.get",
#     "pubsub.topics.list",
#     "pubsub.topics.update",
#     "storage.buckets.update"
#   ]
# }

# # GCS (and other GCP services) requires a service account to act against other services
# data "google_storage_project_service_account" "gcs_sa" {}

# # assigns the uc_file_events role to Storage Credential Service Account
# resource "google_project_iam_member" "uc_project_file_events_admin" {
#   project = var.google_project_id
#   role    = google_project_iam_custom_role.uc_file_events.id
#   member  = "serviceAccount:${databricks_storage_credential.this.databricks_gcp_service_account[0].email}"
# }

# # assigns the pubsub.publisher role to GCS Service Account
# resource "google_project_iam_member" "cloud_storage_sa_pubsub_publisher" {
#   project = var.google_project_id
#   role  = "roles/pubsub.publisher"
#   member = "serviceAccount:${data.google_storage_project_service_account.gcs_sa.email_address}"
# }
