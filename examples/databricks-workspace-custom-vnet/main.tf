## This module deploys a Azure Databricks workspace with an Intel Optimized Cluster in a user provided resource group and virtual network
module "azure_databricks_workspace" {
  source              = "intel/azure-databricks-workspace/intel"
  resource_group_name = "dbx-rg"                             #Required
  dbx_workspace_name  = "azure-test-workspace-vnet"          #Required

  #Custom (Pre-Existing) Virtual Network
  dbx_vnet           = "dbx-vnet"
  dbx_public_subnet  = "dbx-public"
  dbx_private_subnet = "dbx-private"
}