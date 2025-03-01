##################### Valores das Variáveis Dasa ############################
oi           = "00000000"
journey      = "datalake"
environment  = "prd"
product      = "datalake"
support_team = "datalake"

#### Project Variables ####
service_project_id = "prj-dataplatform-services-prd"
host_project_id    = "prj-dasa-spk-prd-fd8c"

#### VPC Variables ####
network           = "vpc-spk-prd"
subnetwork        = "dataplatform-services-gke-prd-us-central1-subnet0"
subnetwork_region = "us-central1"


cloud_composer_network_ipv4_cidr_block = "10.162.164.0/24"
master_ipv4_cidr                       = "10.162.188.160/28"
cloud_sql_ipv4_cidr                    = ""
gke_subnet_ip_range                    = ["10.162.164.0/24"]
gke_pods_services_ip_ranges            = ["10.162.160.0/22", "10.162.165.0/24"]
pod_ip_allocation_range_name           = "dataplatform-services-gke-pods-prd-us-central1-subnet0"
service_ip_allocation_range_name       = "dataplatform-services-gke-services-prd-us-central1-subnet0"
grant_sa_agent_permission              = true
use_private_environment                = true
enable_private_endpoint                = true


#### Cloud Composer variables ####
composer_env_name = "composer-dataops-prd"
region            = "us-central1"
image_version     = "composer-2.2.0-airflow-2.4.3"
environment_size  = "ENVIRONMENT_SIZE_LARGE"

airflow_config_overrides = {
    webserver-rbac_autoregister_per_folder_roles = "True"
    webserver-rbac_user_registration_role        = "UserNoDags"
}

scheduler = {
  cpu        = 16
  memory_gb  = 16
  storage_gb = 1
  count      = 2
}

web_server = {
  cpu        = 4
  memory_gb  = 8
  storage_gb = 2
}

worker = {
  cpu        = 4
  memory_gb  = 15
  storage_gb = 2
  min_count  = 4
  max_count  = 8
}

snapshot_bucket_name          = "gcs_composer_snapshops_prd"
snapshot_bucket_region        = "us-central1"
snapshot_bucket_storage_class = "REGIONAL"
snapshot_enabled              = true
snapshot_creation_schedule    = "0 0 1 * *"

##################### Valores das Variáveis Infrastructure as code  #############
iac_tool       = "Terraform"
iac_repository = "bitbucket.org:dasa_desenv/coetech-iac-gcp-dataplatform-services":