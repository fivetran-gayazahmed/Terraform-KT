
// GCP Bucket Storage connector via Terraform

resource "fivetran_connector" "gcp_via_terraform" {

  group_id          = "your_groupid"
  service           = "gcs"
  run_setup_tests   = true

  destination_schema {
    name  = "gcs_terraform"
    table = "table_name"
  }

  config {

    bucket      = "testing_gcp_bucket"
    prefix      = "Home_Folder/dir_01"
    pattern     = ""
    file_type   = "infer"
    compression = "infer"
    on_error    = "fail"

  }
}

resource "fivetran_connector_schedule" "gcp_schedule" {
  connector_id      = fivetran_connector.gcp_via_terraform.id
  sync_frequency    = 60
  paused            = false
  pause_after_trial = false
}
