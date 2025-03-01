module "storage" {
  source       = "./modules/cloud_storage"
  project_id   = var.project_id
  region       = var.region
  bucket_names = var.bucket_names
  storage      = var.storage
}