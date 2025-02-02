
# Generate freely 3 unique prefixes
# used as prefixes for db's and their usernames
# all instances have same 3x db names and same 3x usernames
resource "random_pet" "dbs" {
  count  = 3
  length = 2
}


#
# Every instance of Postgres DB requires individual block of code in root main.tf
# Every block of code istantiates a new module out of the db_module codebase
#
# db_module should not be changed during instances numbers manipulation
# db_module always performs same operation on every instance
#
# What needs to be changed is "only" the input (how many instances) and 
# output (reading the values after apply)
#
# After instances change the code to be adjusted is here:
# variables.tf
# main.tf
# outputs.tf
# provision.tf

# <change me>
# Copy whole block of code (locals + new module)
# Adjust accordingly only the variable names by replacing _1 with _6 for sixth instance
# Variable names to be adjusted in locals: db_inventory_X, var.db_user_passes_X[i]
# Variable names to be adjusted in new module: db_module_instance_X,
# var.admin_user_pass_X, var.readonly_user_pass_X, local.dbs_inventory_X, instance_X
#
# BLOCK FOR INSTANCE 1
## To be created; databases, users and pass for this instance
locals {
  dbs_inventory_1 = [
    for i in range(3) : {
      db_name  = "${random_pet.dbs[i].id}_db"
      db_user_name = "${random_pet.dbs[i].id}_user"
      db_user_pass = var.db_user_passes_1[i]
    }
  ]
}

## Module
module "db_module_instance_1" {
  source = "./modules/db_module"

  admin_user_name  = var.admin_user_name
  admin_user_pass  = var.admin_user_pass_1
  readonly_user_name = var.readonly_user_name
  readonly_user_pass = var.readonly_user_pass_1
  dbs_inventory        = local.dbs_inventory_1

  providers = {
    postgresql = postgresql.instance_1
  }
}

# BLOCK FOR INSTANCE 2
## To be created; databases, users and pass for this instance
locals {
  dbs_inventory_2 = [
    for i in range(3) : {
      db_name  = "${random_pet.dbs[i].id}_db"
      db_user_name = "${random_pet.dbs[i].id}_user"
      db_user_pass = var.db_user_passes_2[i]
    }
  ]
}

## Module
module "db_module_instance_2" {
  source = "./modules/db_module"

  admin_user_name  = var.admin_user_name
  admin_user_pass  = var.admin_user_pass_2
  readonly_user_name = var.readonly_user_name
  readonly_user_pass = var.readonly_user_pass_2
  dbs_inventory        = local.dbs_inventory_2

  providers = {
    postgresql = postgresql.instance_2
  }
}


# BLOCK FOR INSTANCE 3
## To be created; databases, users and pass for this instance
locals {
  dbs_inventory_3 = [
    for i in range(3) : {
      db_name  = "${random_pet.dbs[i].id}_db"
      db_user_name = "${random_pet.dbs[i].id}_user"
      db_user_pass = var.db_user_passes_3[i]
    }
  ]
}

## Module
module "db_module_instance_3" {
  source = "./modules/db_module"

  admin_user_name  = var.admin_user_name
  admin_user_pass  = var.admin_user_pass_3
  readonly_user_name = var.readonly_user_name
  readonly_user_pass = var.readonly_user_pass_3
  dbs_inventory        = local.dbs_inventory_3

  providers = {
    postgresql = postgresql.instance_3
  }
}

# BLOCK FOR INSTANCE 4
## To be created; databases, users and pass for this instance
locals {
  dbs_inventory_4 = [
    for i in range(3) : {
      db_name  = "${random_pet.dbs[i].id}_db"
      db_user_name = "${random_pet.dbs[i].id}_user"
      db_user_pass = var.db_user_passes_4[i]
    }
  ]
}

## Module
module "db_module_instance_4" {
  source = "./modules/db_module"

  admin_user_name  = var.admin_user_name
  admin_user_pass  = var.admin_user_pass_4
  readonly_user_name = var.readonly_user_name
  readonly_user_pass = var.readonly_user_pass_4
  dbs_inventory        = local.dbs_inventory_4

  providers = {
    postgresql = postgresql.instance_4
  }
}

# BLOCK FOR INSTANCE 5
## To be created; databases, users and pass for this instance
locals {
  dbs_inventory_5 = [
    for i in range(3) : {
      db_name  = "${random_pet.dbs[i].id}_db"
      db_user_name = "${random_pet.dbs[i].id}_user"
      db_user_pass = var.db_user_passes_5[i]
    }
  ]
}

## Module
module "db_module_instance_5" {
  source = "./modules/db_module"

  admin_user_name  = var.admin_user_name
  admin_user_pass  = var.admin_user_pass_5
  readonly_user_name = var.readonly_user_name
  readonly_user_pass = var.readonly_user_pass_5
  dbs_inventory        = local.dbs_inventory_5

  providers = {
    postgresql = postgresql.instance_5
  }
}

# to add new instance copy/paste an instance block align to the new values
