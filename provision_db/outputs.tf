# <change me>
locals {
  db_modules = {
    instance_1 = module.db_module_instance_1
    instance_2 = module.db_module_instance_2
    instance_3 = module.db_module_instance_3
    instance_4 = module.db_module_instance_4
    instance_5 = module.db_module_instance_5
    # Add more instances as needed following the logic above
  }
}

# Standard outputs bellow, no need to change after instances adjustment
output "all_databases" {
  description = "List of all databases across instances"
  value = {
    for instance_key, instance in local.db_modules :
    instance_key => instance.databases
  }
}

output "all_db_users" {
  description = "List of all database users across instances"
  value = {
    for instance_key, instance in local.db_modules :
    instance_key => instance.db_users
  }
}

output "all_db_credentials" {
  description = "Database credentials across instances (sensitive)"
  value = {
    for instance_key, instance in local.db_modules :
    instance_key => instance.db_credentials
  }
  sensitive = true
}


