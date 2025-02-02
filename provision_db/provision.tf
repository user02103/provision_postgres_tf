terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.19.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"  
    }
  }
}

provider "postgresql" {
  alias           = "main"
  host            = "127.0.0.1"
  port            = 5432
  database        = "postgres"
  username        = var.admin_user_name
  password        = var.admin_user_pass
  sslmode         = "disable"
}

provider "random" {}

