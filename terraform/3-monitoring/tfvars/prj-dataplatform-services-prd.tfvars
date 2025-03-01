##################### Valores das Variáveis GCP ###############################
project_id = "prj-dataplatform-services-prd"
region     = "us-central1"

dashboard_display_name = "Cloud Storage"

##################### Valores das Variáveis GCP ###############################
alerts = {
  "Total Bytes Examples" = {
    combiner      = "OR"
    trigger_count = 1
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
  "Total Bytes Exaples 2" = {
    combiner      = "OR"
    trigger_count = 1
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

}

