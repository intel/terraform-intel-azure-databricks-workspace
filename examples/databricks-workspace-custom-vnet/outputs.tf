# Output the URL for the newly-created workspace
output "dbx_workspace_url" {
  description = "URL of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_workspace_url
}

output "dbx_workspace_name" {
  description = "Name of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_workspace_name
}

output "dbx_resource_group_name" {
  description = "Name of the Resource group of databricks workspace"
  value       = module.azure_databricks_workspace.dbx_resource_group_name
}

output "dbx_location" {
  description = "Location of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_location
}

output "dbx_sku" {
  description = "Sku tier of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_sku
}

output "dbx_public_network_access_enabled" {
  description = "Public Network access enabled of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_public_network_access_enabled
}

output "dbx_network_security_group_rules_required" {
  description = "NSG outbound rules of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_network_security_group_rules_required
}

output "dbx_custom_parameters" {
  description = "Custom parameter block of the databricks workspace"
  value       = module.azure_databricks_workspace.dbx_custom_parameters
}