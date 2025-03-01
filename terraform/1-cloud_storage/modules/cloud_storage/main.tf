
provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_storage_bucket" "buckets_raw" {
  for_each      = toset(var.bucket_names)
  name          = each.value
  location      = var.region
  storage_class = var.storage
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
  logging {
    log_bucket = "gcs_logs_${var.project_id}"
  }
  lifecycle_rule {
    condition {
      age = 7
    }
    action {
      type = "SetStorageClass"
      storage_class = "NEARLINE"
    }
  }
  lifecycle_rule {
    condition {
      age = 30
    }
    action {
      type = "SetStorageClass"
      storage_class = "COLDLINE"
    }
  }
  lifecycle_rule {
    condition {
      age = 90
    }
    action {
      type = "SetStorageClass"
      storage_class = "ARCHIVE"
    }
  }
}
