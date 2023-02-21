
// Salesforce connector via Terraform

resource "fivetran_connector" "salesforce_via_terraform" {

  group_id           = "eventually_matching"
  service            = "salesforce"
  sync_frequency     = 180
  paused             = false
  pause_after_trial  = false
  run_setup_tests    = true
  trust_certificates = true
  trust_fingerprints = true

  destination_schema {
    name = "salesforce_terraform"
  }

  config {
    base_url = "https://selfemployed-c5-dev-ed.develop.my.salesforce.com"
  }
  auth {
    client_access {
      client_id     = "#######"
      client_secret = "#######"
    }
    refresh_token = "######"
  }

}
