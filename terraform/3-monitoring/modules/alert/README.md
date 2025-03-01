# Module Alert Policy

This optional module is used to create a Monitoring Alert Policy.

```hcl
module "alert" {
  source = "./modules/alert"
  name          = "Total Bytes"
  combiner      = "OR"
  trigger_count = "1"
  duration      = "120s"
  query         = <<-EOT
        fetch gcs_bucket
            | metric 'storage.googleapis.com/storage/total_bytes'
            | group_by 1m, [value_total_bytes_aggregate: aggregate(value.total_bytes)],
            | every 1m
            | group_by [resource.bucket_name],
            [value_total_bytes_aggregate_aggregate:aggregate(value_total_bytes_aggregate)]
            | condition val(0) < 0
        EOT
}
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the alert policy | `string` |  | yes |
| combiner | How to combine the results of multiple conditions to determine if an incident should be opened. Possible values: [\"AND\", \"OR\", \"AND_WITH_MATCHING_RESOURCE\"] | `string` |  | yes |
| trigger_count | The absolute number of time series that must fail the predicate for the condition to be triggered | `string` |  | yes |
| duration | The amount of time that a time series must violate the threshold to be considered failing | `string` |  | yes |
| query | Monitoring Query Language query that outputs a boolean stream | `string` |  | yes |


## Outputs

| Name | Description |
|------|-------------|
| alert_name | The unique resource name for this policy |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
