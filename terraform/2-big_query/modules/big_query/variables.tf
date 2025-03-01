variable "project_id" {
  description = "The GCP project where Big Query is created"
  type        = string
}

variable "region" {
  description = "Region where the Big Query is created"
  type        = string
}

variable "dataset_names" {
  description = "List of dataset names that will be created"
  type        = list(string)
}