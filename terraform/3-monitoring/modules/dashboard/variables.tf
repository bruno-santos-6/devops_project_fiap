variable "dashboard_display_name" {
  description = "Name of the dashboard"
  type        = string
}

variable "alerts" {
  description = "List of alerts to be displayed in the dashboard"
  type        = list(string)
}

variable "project_id" {
  description = "The GCP project to use for integration tests"
  type        = string
}
