
// MySQL RDS db connector via Terraform

resource "fivetran_connector" "connector" {

  group_id           = "clarinet_inheritance"
  service            = "mysql_rds"
  sync_frequency     = 360
  paused             = false
  pause_after_trial  = false
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
