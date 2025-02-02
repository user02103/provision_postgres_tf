# DB's
resource "postgresql_database" "databases" {
  count = length(var.dbs_inventory)
  name  = var.dbs_inventory[count.index].db_name
}

# USERS
resource "postgresql_role" "db_users" {
  count    = length(var.dbs_inventory)
  name     = var.dbs_inventory[count.index].db_user_name
  password = var.dbs_inventory[count.index].db_user_pass
  login    = true
}

resource "postgresql_role" "readonly_user" {
  name     = var.readonly_user_name
  password = var.readonly_user_pass
  roles = ["pg_read_all_data", "pg_read_all_settings"]
  login    = true
}

# GRANTS
## Grant Full Access to Users on DB (single DB) level only (no schema grants, no table grants)
resource "postgresql_grant" "db_grants" {
  depends_on = [
    postgresql_database.databases,
    postgresql_role.db_users
  ]

  count      = length(var.dbs_inventory)
  database   = var.dbs_inventory[count.index].db_name
  role       = var.dbs_inventory[count.index].db_user_name
  object_type = "database"
  privileges  = ["CONNECT", "CREATE", "TEMPORARY"] # initially used ["ALL"] but it's being overwritten always by terraform apply
}


