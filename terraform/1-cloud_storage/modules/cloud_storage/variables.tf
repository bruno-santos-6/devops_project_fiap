variable "project_id" {
  description = "The GCP project where Cloud Storage is created"
  type        = string
}

variable "region" {
  description = "Region where the Cloud Storage is created"
  type        = string
}
variable "bucket_names" {
  description = "List of bucket names that will be created"
  type        = list(string)
}

variable "storage" {
  description = "Bucket storage class"
  type = string
}