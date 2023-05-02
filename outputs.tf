# Output the URL for the newly-created workspace
output "dbx_workspace_url" {
  description = "URL of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.workspace_url
}

output "dbx_workspace_name" {
  description = "Name of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.name
}

output "dbx_resource_group_name" {
  description = "Name of the Resource group of databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.resource_group_name
}

output "dbx_location" {
  description = "Location of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.location
}

output "dbx_sku" {
  description = "Sku tier of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.sku
}

output "dbx_public_network_access_enabled" {
  description = "Public Network access enabled of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.public_network_access_enabled
}

output "dbx_network_security_group_rules_required" {
  description = "NSG outbound rules of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.network_security_group_rules_required
}

output "dbx_custom_parameters" {
  description = "Custom parameter block of the databricks workspace"
  value       = azurerm_databricks_workspace.az-databricks.custom_parameters
}