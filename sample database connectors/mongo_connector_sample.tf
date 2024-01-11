# Mongo connector via Terraform

resource "fivetran_connector" "mongo_via_terraform" {
  group_id           = "your_group_id"
  service            = "mongo"
  run_setup_tests    = true
  trust_certificates = true

  destination_schema {
    prefix = "test_mongo_tf"
  }
  config {
    hosts        = ["mongodb+srv://mongocluster01.1ipmzlz.mongodb.net/?retryWrites=true&w=majority"]
    user         = "fivetran"
    password     = var.mongo_password
    packing_mode = "UsePackedModeOnly"
  }
}

resource "fivetran_connector_schedule" "mongo_connector_schedule" {
  connector_id      = fivetran_connector.mongo_via_terraform.id
  sync_frequency    = 60
  paused            = false
  pause_after_trial = false
}
