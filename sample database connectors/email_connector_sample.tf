// Email connector via Terraform

resource "fivetran_connector" "email_via_terraform" {

  group_id          = "your_groupid"
  service           = "email"
  run_setup_tests   = false

  destination_schema {
    name  = "test_email_terra_01"
    table = "table_name_01"
  }
  config {
    file_type       = "infer"
    compression     = "infer"
    on_error        = "fail"
  }
}

resource "fivetran_connector_schedule" "email_schedule" {
  connector_id      = fivetran_connector.email_via_terraform.id
  sync_frequency    = 60
  paused            = false
  pause_after_trial = false
}
