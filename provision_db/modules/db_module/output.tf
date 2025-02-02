# Output list of all databases
output "databases" {
  description = "List of all created databases"
  value       = [for db in var.dbs_inventory : db.db_name]
}

# Output list of all database users
output "db_users" {
  description = "List of all created database users"
  value       = [for db in var.dbs_inventory : db.db_user_name]
}

# Output database credentials
output "db_credentials" {
  description = "List of usernames and passwords for each database"
  value = [
    for db in var.dbs_inventory : {
      username = db.db_user_name
      password = db.db_user_pass
      database = db.db_name
    }
  ]
  sensitive = true 
}

