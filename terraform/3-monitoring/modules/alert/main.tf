resource "google_monitoring_alert_policy" "service_alert_policy" {
  project      = var.project_id
  display_name = var.name
  combiner     = var.combiner
  conditions {
    display_name = var.name
    condition_monitoring_query_language {
      query        = var.query
      duration     = var.duration
      trigger {
        count = var.trigger_count
      }
    }
  }
}
