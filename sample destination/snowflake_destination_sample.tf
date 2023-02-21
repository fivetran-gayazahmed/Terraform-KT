
// Creating a new Group -- Giving our destination a name

resource "fivetran_group" "group" {
  name = "Gayaz_SF_via_TF_02"
}

// Configuring our destination based on the above GroupId

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
    user     = "FIVETRAN_USER_02"
    password = var.snowflake_pass
    database = "FIVETRAN_DATABASE_02"
    auth     = "PASSWORD"
  }

}

