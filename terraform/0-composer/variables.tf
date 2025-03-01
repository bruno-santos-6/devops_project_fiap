
variable "environment" {
  description = "The environment the single project belongs to"
  type        = string
}

#### Project Variables ####
variable "service_project_id" {
  description = "Project ID where Cloud Composer Environment is created."
  type        = string
}

variable "host_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
}

#### VPC Variables ####
variable "network" {
  type        = string
  description = "The name of the network being created"
}

variable "subnetwork" {
  type        = string
  description = "The subnetwork to host the composer cluster."
}


variable "subnetwork_region" {
  type        = string
  description = "The subnetwork region to host the composer cluster."
}


#### Cloud Composer variables ####
variable "composer_env_name" {
  description = "The name of the Cloud Composer Environment"
  type        = string
}

variable "region" {
  description = "Region where the Cloud Composer Environment is created."
  type        = string
}

variable "environment_size" {
  description = "The environment size controls the performance parameters of the managed Cloud Composer infrastructure that includes the Airflow database. Values for environment size are: ENVIRONMENT_SIZE_SMALL, ENVIRONMENT_SIZE_MEDIUM, and ENVIRONMENT_SIZE_LARGE."
  type        = string
}

variable "scheduler" {
  description = "Configuration for resources used by Airflow schedulers."
  type = object({
    cpu        = string
    memory_gb  = number
    storage_gb = number
    count      = number
  })
}

variable "web_server" {
  description = "Configuration for resources used by Airflow web server."
  type = object({
    cpu        = string
    memory_gb  = number
    storage_gb = number
  })
}

variable "worker" {
  description = "Configuration for resources used by Airflow workers."
  type = object({
    cpu        = string
    memory_gb  = number
    storage_gb = number
    min_count  = number
    max_count  = number
  })
}

variable "cloud_composer_network_ipv4_cidr_block" {
  description = ""
  type        = string
}

variable "master_ipv4_cidr" {
  description = ""
  type        = string
}

variable "cloud_sql_ipv4_cidr" {
  description = ""
  type        = string
}

variable "gke_subnet_ip_range" {
  description = ""
  type        = list(string)
}

variable "gke_pods_services_ip_ranges" {
  description = ""
  type        = list(string)
}

variable "pod_ip_allocation_range_name" {
  description = ""
  type        = string
}

variable "service_ip_allocation_range_name" {
  description = ""
  type        = string
}

variable "grant_sa_agent_permission" {
  description = ""
  type        = bool
}

variable "use_private_environment" {
  description = ""
  type        = bool
}

variable "enable_private_endpoint" {
  description = ""
  type        = bool
}

variable "image_version" {
  description = ""
  type        = string
}

variable "airflow_config_overrides" {
  description = ""
  type        = map(string)
  default     = {}
}

variable "snapshot_bucket_name" {
  description = "Bucket name that will be created"
  type        = string
}

variable "snapshot_bucket_storage_class" {
  description = "Bucket storage class"
  type        = string
}

variable "snapshot_bucket_region" {
  description = "Region where the Cloud Storage bucket will be created"
  type        = string
}

variable "snapshot_enabled" {
  type        = bool
  description = "Enable Scheduled Snapshot"
}

variable "snapshot_creation_schedule" {
  type        = string
  description = "Cron syntax frequency to create snapshots"
}
