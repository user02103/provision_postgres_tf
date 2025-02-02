
# Generate freely 3 unique prefixes
# used as prefixes for db's and their usernames
resource "random_pet" "dbs" {
  count  = 3
  length = 2
}

# Define local list for databases and users
locals {
  dbs_inventory = [
    for i in range(3) : {
      db_name  = "${random_pet.dbs[i].id}_db"
      db_user_name = "${random_pet.dbs[i].id}_user"
      db_user_pass = var.db_user_passes[i]
    }
  ]
}

module "db_module" {
  source = "./modules/db_module"

  admin_user_name  = var.admin_user_name
  admin_user_pass  = var.admin_user_pass
  readonly_user_name = var.readonly_user_name
  readonly_user_pass = var.readonly_user_pass
  dbs_inventory        = local.dbs_inventory

  providers = {
    postgresql = postgresql.main
  }

}
