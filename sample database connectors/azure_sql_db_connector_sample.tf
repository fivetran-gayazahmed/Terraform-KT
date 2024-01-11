
// Azure SQL Server db connector via Terraform

resource "fivetran_connector" "sql_db_via_terraform" {

  group_id           = "clarinet_inheritance"
  service            = "azure_sql_db"
  run_setup_tests    = true
  trust_certificates = true

  destination_schema {
    prefix = "sql_db_terra"
  }

  config {
    public_key    = "ssh-rsa AAAAB3####== fivetran user key\n"
    database      = "sqlserver01"
    password      = "#####"
    port          = "1433"
    update_method = "DIRECT"
    host          = "sqlserver-5tran.database.windows.net"
    user          = "fivetran@sqlserver-5tran.database.windows.net"
  }
}

resource "fivetran_connector_schedule" "azure_db_schedule" {
  connector_id      = fivetran_connector.sql_db_via_terraform.id
  sync_frequency    = 60
  paused            = false
  pause_after_trial = false
}

