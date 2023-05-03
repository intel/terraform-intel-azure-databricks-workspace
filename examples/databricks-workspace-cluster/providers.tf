# Specifying the provider for Azure resources
provider "azurerm" {
  features {}
}

provider "databricks" {
  host = module.azure-dbx-workspace.dbx_workspace_url
}