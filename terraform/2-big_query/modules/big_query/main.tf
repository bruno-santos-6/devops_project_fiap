provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_bigquery_dataset" "datasets" {
  for_each      = toset(var.dataset_names)
  dataset_id    = each.key
  location      = var.region
}