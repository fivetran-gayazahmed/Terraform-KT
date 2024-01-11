
// Salesforce connector via Terraform

resource "fivetran_connector" "salesforce_via_terraform" {

  group_id           = "your_groupid"
  service            = "salesforce"
  run_setup_tests    = true

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

resource "fivetran_connector_schedule" "salesforce_schedule" {
  connector_id      = fivetran_connector.salesforce_via_terraform.id
  sync_frequency    = 60
  paused            = false
  pause_after_trial = false
}
