
// GCP Bucket Storage connector via Terraform

resource "fivetran_connector" "gcp_via_terraform" {

  group_id          = "eventually_matching"
  service           = "gcs"
  sync_frequency    = 180
  paused            = false
  pause_after_trial = false
  run_setup_tests   = true

  destination_schema {
    name  = "gcs_terraform"
    table = "v6_10"
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
