# Specifying the provider for Azure resources
provider "azurerm" {
  features {}
}

// Intializing the following provider is REQUIRED step in order to add the databricks_global_init_script and databricks_cluster resource to your Databricks Workspace
provider "databricks" {
  host = module.azure_databricks_workspace.dbx_workspace_url
}

// Intializing the following provider is REQUIRED step in order to add the databricks_global_init_script and databricks_cluster resource to your Databricks Workspace
provider "databricks" {
  alias = "cluster"
  host  = module.azure_databricks_workspace.dbx_workspace_url
}