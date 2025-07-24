resource "google_storage_bucket" "ext_bucket" {
  name          = "${local.prefix}-ext-bucket"
  project       = var.gcp_project_id
  location      = var.gcp_region
  force_destroy = true

  labels = var.default_tags
}

resource "google_storage_bucket_iam_member" "gcs_admin" {
  bucket = google_storage_bucket.ext_bucket.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${databricks_storage_credential.this.databricks_gcp_service_account[0].email}"
}

resource "google_storage_bucket_iam_member" "gcs_reader" {
  bucket = google_storage_bucket.ext_bucket.name
  role   = "roles/storage.legacyBucketReader"
  member = "serviceAccount:${databricks_storage_credential.this.databricks_gcp_service_account[0].email}"
}
