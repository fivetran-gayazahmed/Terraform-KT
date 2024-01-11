
// MySQL RDS db connector via Terraform

resource "fivetran_connector" "mysql_connector" {

  group_id           = "your_group_id"
  service            = "mysql_rds"
  run_setup_tests    = true
  trust_certificates = true

  destination_schema {
    name   = "mysql_demo"
    prefix = "rds_terra"
  }

  config {
    host          = "XXX"
    port          = 3306
    user          = "XXX"
    password      = "XXXX"
    update_method = "BINLOG"
  }
}

resource "fivetran_connector_schedule" "mysql_db_schedule" {
  connector_id      = fivetran_connector.mysql_connector.id
  sync_frequency    = 60
  paused            = false
  pause_after_trial = false
}
