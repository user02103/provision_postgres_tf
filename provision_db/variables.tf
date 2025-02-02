# Users
variable "admin_user_name" {
  description = "Administrator user name"
  type        = string
}

variable "readonly_user_name" {
  description = "Readonly user name"
  type        = string
}

# Passwords
variable "admin_user_pass" {
  description = "Administrator user password"
  type        = string
  sensitive   = true
}

variable "readonly_user_pass" {
  description = "Readonly user password"
  type        = string
  sensitive   = true
}

variable "db_user_passes" {
  type      = list(string)
  sensitive = true
}

