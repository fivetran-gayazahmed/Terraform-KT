
// Square connector via Terraform

resource "fivetran_connector" "tf_square" {
  group_id           = "unimpaired_prestige"
  service            = "square"
  sync_frequency     = 120
  paused             = true
  pause_after_trial  = true
  trust_certificates = true
  run_setup_tests    = false

  destination_schema {
    name = "tf_square"
  }

  config {
    client_id     = "######"
    client_secret = "######"
  }

}
