resource "google_storage_bucket" "bucket_composer_snapshots" {
  name                        = var.bucket_name
  location                    = var.region
  storage_class               = var.storage_class
  project                     = var.project_id
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  logging {
    log_bucket = "gcs_logs_${var.project_id}"
  }
  lifecycle_rule {
    condition {
      age = 31
    }
    action {
      type          = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }
  lifecycle_rule {
    condition {
      matches_storage_class = ["NEARLINE"]
      age                   = 62
    }
    action {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
  lifecycle_rule {
    condition {
      age                   = 93
      matches_storage_class = ["COLDLINE"]
    }
    action {
      type = "Delete"
    }
  }
}
