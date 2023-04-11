## This module deploys a Azure Databricks workspace with an Intel Optimized Cluster in a user provided resource group
module "azure-dbx-workspace" {
  source              = "intel/azure-databricks/intel"
  resource_group_name = "dbx-rg"                            #Required
  dbx_workspace_name  = "azure-test-workspace"              #Required
}