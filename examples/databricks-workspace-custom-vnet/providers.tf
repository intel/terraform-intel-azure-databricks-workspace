# Specifying the provider for Azure resources
provider "azurerm" {
  features {}
}

provider "databricks" {
  host = module.azure_databricks_workspace.dbx_workspace_url
}