module "monitoring_dashboard" {
  source                 = "./modules/dashboard"
  project_id             = var.project_id
  dashboard_display_name = var.dashboard_display_name
  alerts                 = [for alert in module.alerts.* [0] : alert.alert_name]
  depends_on             = [module.alerts]
}

module "alerts" {
  source        = "./modules/alert"
  for_each      = var.alerts
  project_id    = var.project_id
  name          = each.key
  combiner      = each.value.combiner
  trigger_count = each.value.trigger_count
  duration      = each.value.duration
  query         = each.value.query
}