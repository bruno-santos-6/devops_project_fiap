module "storage" {
  source                                 = "./modules/big_query"
  project_id                             = var.project_id
  region                                 = var.region
  dataset_names                          = var.dataset_names
}