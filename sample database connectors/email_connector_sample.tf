// Email connector via Terraform

resource "fivetran_connector" "email_via_terraform" {

  group_id          = "eventually_matching"
  service           = "email"
  sync_frequency    = 15
  paused            = true
  pause_after_trial = false
  run_setup_tests   = false

  destination_schema {
    name  = "test_email_terra_01"
    table = "table_name_01"
  }
  config {
    pattern         = ""
    file_type       = "infer"
    compression     = "infer"
    on_error        = "fail"
    archive_pattern = ""
    null_sequence   = ""
    delimiter       = ""
    escape_char     = ""
    skip_before     = "0"
    skip_after      = "0"
  }
}
