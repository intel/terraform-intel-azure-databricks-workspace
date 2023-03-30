# Output the URL for the newly-created workspace
output "dbx_workspace_url" {
  description = "URL of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_workspace_url
}

output "dbx_workspace_name" {
  description = "Name of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_workspace_name
}

output "dbx_resource_group_name" {
  description = "Name of the Resource group of databricks workspace"
  value       = module.azure-dbx-workspace.dbx_resource_group_name
}

output "dbx_location" {
  description = "Location of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_location
}

output "dbx_sku" {
  description = "Sku tier of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_sku
}

output "dbx_public_network_access_enabled" {
  description = "Public Network access enabled of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_public_network_access_enabled
}

output "dbx_network_security_group_rules_required" {
  description = "NSG outbound rules of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_network_security_group_rules_required
}

output "dbx_custom_parameters" {
  description = "Custom parameter block of the databricks workspace"
  value       = module.azure-dbx-workspace.dbx_custom_parameters
}

### Databricks Cluster #####
output "dbx_cluster_name" {
  description = "Name of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_name
}

output "dbx_cluster_spark_version" {
  description = "Spark version of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_spark_version
}

output "dbx_cluster_node_type_id" {
  description = "Instance type of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_node_type_id
}

output "dbx_cluster_autoterminate_min" {
  description = "Autoterminate minute of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_autoterminate_min
}

output "dbx_cluster_runtime_engine" {
  description = "Runtime Engine of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_runtime_engine
}

output "dbx_cluster_num_workers" {
  description = "Num of workers nodes of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_num_workers
}

output "dbx_cluster_spark_conf" {
  description = "Spark Configurations of the databricks cluster"
  value       = module.azure-dbx-workspace.dbx_cluster_spark_conf
}

output "dbx_cluster_custom_tags" {
  description = "Custom Tags"
  value       = module.azure-dbx-workspace.dbx_cluster_custom_tags
}