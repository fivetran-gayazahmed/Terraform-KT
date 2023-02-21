# Mongo connector via Terraform

resource "fivetran_connector" "mongo_via_terraform" {

  group_id           = fivetran_destination.dest.group_id
  service            = "mongo"
  sync_frequency     = 5
  paused             = false
  pause_after_trial  = false
  run_setup_tests    = true
  trust_certificates = true

  destination_schema {
    prefix = "test_mongo_tf"
  }

  config {
    hosts    = ["mongodb+srv://mongocluster01.1ipmzlz.mongodb.net/?retryWrites=true&w=majority"]
    user     = "fivetran"
    password = var.mongo_pass
  }

}