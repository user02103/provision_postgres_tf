variable "admin_user_name" {}
variable "admin_user_pass" {}

variable "readonly_user_name" {}
variable "readonly_user_pass" {}

variable "dbs_inventory" {
  type = list(object({
    db_name  = string
    db_user_name = string
    db_user_pass = string
  }))
}

