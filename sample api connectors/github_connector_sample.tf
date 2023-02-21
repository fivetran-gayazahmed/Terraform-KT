
// Github connector via Terraform

resource "fivetran_connector" "tf_github" {
  group_id           = "unimpaired_prestige"
  service            = "github"
  sync_frequency     = 120
  paused             = true
  pause_after_trial  = true
  trust_certificates = true
  run_setup_tests    = true

  destination_schema {
    name = "tf_github"
  }

  config {
    sync_mode    = "SpecificRepositories"
    repositories = ["12345678", "23456789"]
    use_webhooks = false
  }
}
