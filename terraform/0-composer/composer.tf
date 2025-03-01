module "composer_snapshot_bucket" {
  source        = "./modules/snapshot_storage"
  project_id    = var.service_project_id
  bucket_name   = var.snapshot_bucket_name
  region        = var.snapshot_bucket_region
  storage_class = var.snapshot_bucket_storage_class
}

module "composer_net" {
  source                                 = "./modules/composer_net"
  service_project_id                     = var.service_project_id
  network_project_id                     = var.host_project_id
  composer_env_name                      = var.composer_env_name
  region                                 = var.region
  network                                = var.network
  subnetwork                             = var.subnetwork
  cloud_composer_network_ipv4_cidr_block = var.cloud_composer_network_ipv4_cidr_block
  master_ipv4_cidr                       = var.master_ipv4_cidr
  cloud_sql_ipv4_cidr                    = var.cloud_sql_ipv4_cidr
  gke_subnet_ip_range                    = var.gke_subnet_ip_range
  gke_pods_services_ip_ranges            = var.gke_pods_services_ip_ranges
}

module "composer_env" {
  depends_on = [
    module.composer_net,
    module.composer_snapshot_bucket
  ]
  source                                 = "./modules/create_environment_v2"
  project_id                             = var.service_project_id
  network_project_id                     = var.host_project_id
  composer_env_name                      = var.composer_env_name
  composer_service_account               = module.composer_net.composer_sa_email
  region                                 = var.region
  network                                = var.network
  subnetwork                             = var.subnetwork
  cloud_composer_network_ipv4_cidr_block = var.cloud_composer_network_ipv4_cidr_block
  master_ipv4_cidr                       = var.master_ipv4_cidr
  cloud_sql_ipv4_cidr                    = var.cloud_sql_ipv4_cidr
  pod_ip_allocation_range_name           = var.pod_ip_allocation_range_name
  service_ip_allocation_range_name       = var.service_ip_allocation_range_name
  grant_sa_agent_permission              = var.grant_sa_agent_permission
  use_private_environment                = var.use_private_environment
  enable_private_endpoint                = var.enable_private_endpoint
  environment_size                       = var.environment_size
  scheduler                              = var.scheduler
  web_server                             = var.web_server
  worker                                 = var.worker
  snapshot_enabled                       = var.snapshot_enabled
  snapshot_location                      = module.composer_snapshot_bucket.bucket_uri
  snapshot_creation_schedule             = var.snapshot_creation_schedule
  airflow_config_overrides               = var.airflow_config_overrides
}
