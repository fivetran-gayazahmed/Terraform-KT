terraform {
  required_providers {
    fivetran = {
      version = "0.6.11"
      source  = "fivetran/fivetran"
    }
  }
}
provider "fivetran" {
  api_key    = var.key
  api_secret = var.secret
}


# CONNECTOR CODE

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


## DESTINATION CODE

resource "fivetran_group" "group" {
  name = "Gayaz_SF_via_TF_${local.version}"
}

resource "fivetran_destination" "dest" {
  group_id           = fivetran_group.group.id
  service            = "snowflake"
  time_zone_offset   = "0"
  region             = "GCP_US_EAST4"
  trust_certificates = "true"
  trust_fingerprints = "true"
  run_setup_tests    = "true"

  config {
    host     = "oq54259.europe-west4.gcp.snowflakecomputing.com"
    port     = 443
    database = "FIVETRAN_DATABASE_${local.version}"
    auth     = "PASSWORD"
    user     = "FIVETRAN_USER_${local.version}"
    password = var.snowflake_pass

  }

}


