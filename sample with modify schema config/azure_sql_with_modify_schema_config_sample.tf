// Azure SQL Server db connector with Schema Config changes

resource "fivetran_connector" "sql_db_via_terraform" {

  group_id           = "clarinet_inheritance"
  service            = "azure_sql_db"
  sync_frequency     = 360
  paused             = false
  pause_after_trial  = false
  run_setup_tests    = true
  trust_certificates = true
  destination_schema {
    prefix = "sql_db_terra"
  }
  config {
    public_key    = "ssh-rsa AAAAB3N####== fivetran user key\n"
    database      = "sqlserver01"
    password      = "#######"
    port          = "1433"
    update_method = "DIRECT"
    host          = "sqlserver-5tran.database.windows.net"
    user          = "fivetran@sqlserver-5tran.database.windows.net"
  }
}

resource "fivetran_connector_schema_config" "schema" {
  depends_on             = [fivetran_connector.sql_db_via_terraform]
  connector_id           = fivetran_connector.sql_db_via_terraform.id
  schema_change_handling = "ALLOW_COLUMNS"
  schema {
    name = "dbo"
    table {
      name    = "Persons"
      enabled = "false"
    }
  }
}
