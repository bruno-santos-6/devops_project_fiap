variable "alerts" {
  description = "Name of the alert"
  type        = map(map(string))
}

variable "dashboard_display_name" {
  description = "Name of the dashboard"
  type        = string
}
