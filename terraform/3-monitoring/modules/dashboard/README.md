# Module  Monitoring Dashboard

This optional module is used to create a Monitoring Dashboard.

```hcl
module "monitoring_dashboard" {
  source                 = "./modules/dashboard"
  project_id             = "prj-123"
  dashboard_display_name = "dashboard"
  alerts                 = [""]
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|dashboard_display_name|Name of the dashboard|String||Yes|
|alerts|List of alerts to be displayed in the dashboard|list(string)||   Yes    |
|project_id|The GCP project to use for integration tests|String|| Yes|




## Outputs

| Name | Description |
|------|-------------|


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
