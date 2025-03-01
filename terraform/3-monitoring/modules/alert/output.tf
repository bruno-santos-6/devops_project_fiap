output "alert_name" {
  value       = google_monitoring_alert_policy.service_alert_policy.name
  description = "The unique resource name for this policy"
}