
resource "google_monitoring_dashboard" "service_dashboard" {
  project = var.project_id
  dashboard_json = <<EOF
{
  "category": "CUSTOM",
  "displayName": "${var.dashboard_display_name}",
  "mosaicLayout": {
    "columns": 12,
    "tiles": [
      {
        "height": 1,
        "widget": {
          "text": {
            "content": "",
            "format": "MARKDOWN"
          },
          "title": "${var.dashboard_display_name}"
        },
        "width": 12,
        "xPos": 0,
        "yPos": 0
      },
    ${join(",", [for alert in var.alerts : <<-EOT
        {
            "height": 4,
            "widget": {
            "alertChart": {
                "name": "${alert}"
            }
            },
            "width": 6,
            "xPos": 0,
            "yPos": ${(index(var.alerts, alert) + 1) * 6}
        }
        EOT
])}
    ]
  }
}
EOF
}