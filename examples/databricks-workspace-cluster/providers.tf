# Specifying the provider for Azure resources
provider "azurerm" {
  features {}
}

provider "databricks" {
  host =  azurerm_databricks_workspace.az-databricks.workspace_url 
}