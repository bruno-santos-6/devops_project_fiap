##################### Valores das Variáveis GCP ###############################
project_id = "prj-dataplatform-services-hml"
region     = "us-central1"

dashboard_display_name = "Cloud Composer Environment"

##################### Valores das Variáveis GCP ###############################
alerts = {
  "Web Server Health" = {
    combiner      = "OR"
    trigger_count = 1
    duration      = "120s"
    query         = <<-EOT
        fetch cloud_composer_environment
          | metric 'composer.googleapis.com/environment/web_server/health'
          | group_by 1m, [value_health_fraction_true: fraction_true(value.health)]
          | every 1m
          | group_by [],
          [value_health_fraction_true_aggregate:
            aggregate(value_health_fraction_true)]
          | condition val(0) < 1
        EOT
  }
  "Composer Environment Health" = {
    combiner      = "OR"
    trigger_count = 1
    duration      = "120s"
    query         = <<-EOT
        fetch cloud_composer_environment
        | metric 'composer.googleapis.com/environment/healthy'
        | group_by 1m, [value_healthy_fraction_true: fraction_true(value.healthy)]
        | every 1m
        | group_by [],
          [value_healthy_fraction_true_mean: mean(value_healthy_fraction_true)]
        | condition val(0) < 1
        EOT
  }

  "Composer Environment Health" = {
    combiner      = "OR"
    trigger_count = 1
    duration      = "120s"
    query         = <<-EOT
        fetch cloud_composer_environment
        | metric 'composer.googleapis.com/environment/healthy'
        | group_by 1m, [value_healthy_fraction_true: fraction_true(value.healthy)]
        | every 1m
        | group_by [],
          [value_healthy_fraction_true_mean: mean(value_healthy_fraction_true)]
        | condition val(0) < 1
        EOT
  }

  "Database Health" = {
    combiner      = "OR"
    trigger_count = 1
    duration      = "120s"
    query         = <<-EOT
        fetch cloud_composer_environment
        | metric 'composer.googleapis.com/environment/database_health'
        | group_by 1m,
            [value_database_health_fraction_true: fraction_true(value.database_health)]
        | every 1m
        | group_by [],
            [value_database_health_fraction_true_mean: mean(value_database_health_fraction_true)]
        | condition val(0) < 1
        EOT
  }
}

