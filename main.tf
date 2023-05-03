locals {
  #Determines wheter to use custom user-provided virtual network or databricks-managed network
  use_vnet = var.dbx_vnet == "" ? false : true
}

resource "random_string" "naming" {
  special = false
  upper   = false
  length  = 6
}

# Use the resource group for the Databricks workspace
data "azurerm_resource_group" "databricks" {
  name = var.resource_group_name
}

data "azurerm_virtual_network" "dbx-vnet" {
  count               = local.use_vnet ? 1 : 0
  name                = var.dbx_vnet
  resource_group_name = data.azurerm_resource_group.databricks.name
}

data "azurerm_subnet" "dbx-public" {
  count                = local.use_vnet ? 1 : 0
  name                 = var.dbx_public_subnet
  virtual_network_name = data.azurerm_virtual_network.dbx-vnet[0].name
  resource_group_name  = data.azurerm_resource_group.databricks.name
}

data "azurerm_subnet" "dbx-private" {
  count                = local.use_vnet ? 1 : 0
  name                 = var.dbx_private_subnet
  virtual_network_name = data.azurerm_virtual_network.dbx-vnet[0].name
  resource_group_name  = data.azurerm_resource_group.databricks.name
}

# Create a Databricks workspace in the resource group
resource "azurerm_databricks_workspace" "az-databricks" {
  name                                  = var.dbx_workspace_name
  location                              = data.azurerm_resource_group.databricks.location
  resource_group_name                   = data.azurerm_resource_group.databricks.name
  sku                                   = var.dbx_sku
  public_network_access_enabled         = var.dbx_public_network_access_enabled
  network_security_group_rules_required = var.dbx_public_network_access_enabled == false ? "NoAzureDatabricksRules" : var.dbx_network_security_group_rules_required
  managed_resource_group_name           = "${data.azurerm_resource_group.databricks.name}-${random_string.naming.result}"


  custom_parameters {
    no_public_ip                                         = false
    virtual_network_id                                   = local.use_vnet ? data.azurerm_virtual_network.dbx-vnet[0].id : null
    public_subnet_name                                   = local.use_vnet ? data.azurerm_subnet.dbx-public[0].name : null
    public_subnet_network_security_group_association_id  = local.use_vnet ? data.azurerm_subnet.dbx-public[0].id : null
    private_subnet_name                                  = local.use_vnet ? data.azurerm_subnet.dbx-private[0].name : null
    private_subnet_network_security_group_association_id = local.use_vnet ? data.azurerm_subnet.dbx-public[0].id : null
  }

  tags = var.tags

}

################ Global Init Script ###########################
resource "databricks_global_init_script" "intel_optimized_script" {
  name    = "Intel Optimized ML-AI Init Script"
  enabled = true
  content_base64 = base64encode(<<-EOT
    #!/bin/bash
    pip install --upgrade pip
    pip install intel-tensorflow==2.11.0
    pip install scikit-learn-intelex
    EOT
  )
  depends_on = [ azurerm_databricks_workspace.az-databricks ]
}



