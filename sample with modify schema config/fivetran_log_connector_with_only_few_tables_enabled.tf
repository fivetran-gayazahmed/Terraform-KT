
// Fivetran Log Connector via Terraform

resource "fivetran_connector" "fivetran_log_by_terraform" {
  group_id          = "eventually_matching"
  service           = "fivetran_log"
  sync_frequency    = 360
  paused            = false
  pause_after_trial = false
  run_setup_tests   = true

  config {
  }

  destination_schema {
    name = "fivetran_log_dest"
  }
}


resource "fivetran_connector_schema_config" "schema" {
  connector_id           = fivetran_connector.fivetran_log_by_terraform.id
  schema_change_handling = "ALLOW_COLUMNS"
  depends_on             = [fivetran_connector.fivetran_log_by_terraform]
  schema {
    name = "fivetran_log"
    table {
      name    = "usage_cost"
      enabled = "false"

    }
  }
}
