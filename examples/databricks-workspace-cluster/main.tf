## This module deploys a Azure Databricks workspace with an Intel Optimized Cluster in a user provided resource group
module "azure_databricks_workspace" {
  source              = "intel/azure-databricks-workspace/intel"
  resource_group_name = "dbx-rg"               #Required
  dbx_workspace_name  = "azure-test-workspace" #Required
}

# This example creates databricks cluster on an your Azure dbx workspace created above.
module "databricks_cluster" {
  source    = "intel/databricks-cluster/intel"
  dbx_host  = module.azure_databricks_workspace.dbx_workspace_url   #Required
  dbx_cloud = "azure"                                               #Required
  depends_on = [
    module.azure_databricks_workspace
  ]
  providers = {
    databricks = databricks.cluster
  }
  tags = {
    "owner"    = "user@example.com"
    "module"   = "Intel-Cloud-Optimization-Module"
  }
}