terraform {
  required_providers {
    azurerm = "~> 3.48"
    random  = "~> 3.4.3"
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.13.0"
    }
  }

}

# Specifying the provider for Azure resources
provider "azurerm" {
  features {}
}

provider "databricks" {
  host = azurerm_databricks_workspace.az-databricks.workspace_url
}