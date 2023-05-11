terraform {
  required_providers {
    azurerm = "~> 3.48"
    random  = "~> 3.4.3"
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.14.2"
    }
  }

}