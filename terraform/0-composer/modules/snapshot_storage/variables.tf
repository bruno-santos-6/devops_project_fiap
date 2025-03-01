variable "project_id" {
  description = "The GCP project where Cloud Storage is created"
  type        = string
}

variable "region" {
  description = "Region where the Cloud Storage is created"
  type        = string
}

variable "bucket_name" {
  description = "Bucket name that will be created"
  type        = string
}

variable "storage_class" {
  description = "Bucket storage class"
  type        = string
}