## This module deploys a Azure Databricks workspace with an Intel Optimized Cluster in a user provided resource group
module "azure-dbx-workspace" {
  source = "../../"
  resource_group_name = "dbx-rg"                                        #Required
  dbx_workspace_name = "azure-shreejan-test-workspace-def"              #Required
}