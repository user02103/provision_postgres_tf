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

provider "random" {}

provider "postgresql" {
  alias           = "instance_1"
  host            = "127.0.0.1"
  port            = 5432
  database        = "postgres"
  username        = var.admin_user_name
  password        = var.admin_user_pass_1
  sslmode         = "disable"
}

provider "postgresql" {
  alias           = "instance_2"
  host            = "127.0.0.1"
  port            = 5433
  database        = "postgres"
  username        = var.admin_user_name
  password        = var.admin_user_pass_2
  sslmode         = "disable"
}

provider "postgresql" {
  alias           = "instance_3"
  host            = "127.0.0.1"
  port            = 5434
  database        = "postgres"
  username        = var.admin_user_name
  password        = var.admin_user_pass_3
  sslmode         = "disable"
}

provider "postgresql" {
  alias           = "instance_4"
  host            = "127.0.0.1"
  port            = 5435
  database        = "postgres"
  username        = var.admin_user_name
  password        = var.admin_user_pass_4
  sslmode         = "disable"
}

provider "postgresql" {
  alias           = "instance_5"
  host            = "127.0.0.1"
  port            = 5436
  database        = "postgres"
  username        = var.admin_user_name
  password        = var.admin_user_pass_5
  sslmode         = "disable"
}

## add new instance by adding new provider resource with unique resource alias,port and pass