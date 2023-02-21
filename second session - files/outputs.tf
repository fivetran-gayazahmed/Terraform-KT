
# OUTPUT VALUES FOR CONNECTOR 

output "my_connector_id" {
  value = fivetran_connector.mongo_via_terraform.id
}

output "my_connector_status" {
  value = fivetran_connector.mongo_via_terraform.status
}



# OUTPUT VALUES FOR DESTINATION 

output "new_group_id" {
  value = fivetran_destination.dest.group_id
}

output "new_status" {
  value = fivetran_destination.dest.setup_status
}
