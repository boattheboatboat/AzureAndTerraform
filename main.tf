terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "RG-Azure-SQL-01" {
  name     = "U-SC-RG-Azure-SQL-01"
  location = var.UAT-Azure-Location
  tags     = var.UAT-Azure-Tags
}

resource "azurerm_storage_account" "SA-Azure-SQL-01" {
  name                     = "uscsaazuresql01"
  resource_group_name      = azurerm_resource_group.RG-Azure-SQL-01.name
  location                 = var.UAT-Azure-Location
  account_tier             = var.UAT-Azure-Account_tier
  account_replication_type = var.UAT-Azure-account_replication_type
  tags                     = var.UAT-Azure-Tags
}

resource "azurerm_mssql_server" "SQLSRV-Azure-SQL-01" {
  name                         = "u-sc-sql-srv-01"
  resource_group_name          = azurerm_resource_group.RG-Azure-SQL-01.name
  location                     = var.UAT-Azure-Location
  version                      = "12.0"
  administrator_login          = "dbajimhil"
  administrator_login_password = "MyV3ryVERYs3cUREp4$$w0rD"
  tags                         = var.UAT-Azure-Tags
}

resource "azurerm_mssql_database" "SQlDB-Azure-SQL-01" {
  name           = "U-SC-DB-01"
  server_id      = azurerm_mssql_server.SQLSRV-Azure-SQL-01.id
  collation      = var.UAT-Azure-Collation
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "S0"
  sample_name    = "AdventureWorksLT"
  zone_redundant = true
  tags           = var.UAT-Azure-Tags
}

#Just a Test
