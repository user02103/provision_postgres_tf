output "databases" {
  description = "List of all databases"
  value       = module.db_module.databases
}

output "db_users" {
  description = "List of all database users"
  value       = module.db_module.db_users
}

output "db_credentials" {
  description = "Database credentials (sensitive)"
  value       = module.db_module.db_credentials
  sensitive   = true
}

