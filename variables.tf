########################
####     Intel      ####
########################

########################
####    Required    ####
########################

variable "resource_group_name" {
  description = "Existing Resource Group where databricks reosurce will be created."
  type        = string
}

variable "dbx_workspace_name" {
  description = "Name of the databricks workspace that will be created."
  type        = string
}

########################
####     Other      ####
########################
variable "dbx_vnet" {
  description = "Name of the virtual network for your Databricks worskpace. Required only if you like to use your own virtual network else it will be on a databricks network"
  type        = string
  default     = ""
}

variable "dbx_public_subnet" {
  description = "Name of the public subnet in your virtual network for your Databricks worskpace. Required only if you like to use your own virtual network else it will be on a databricks network"
  type        = string
  default     = ""
}

variable "dbx_private_subnet" {
  description = "Name of the private subnet in your virtual network for your Databricks worskpace. Required only if you like to use your own virtual network else it will be on a databricks network"
  type        = string
  default     = ""
}

variable "dbx_sku" {
  description = "The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial."
  type        = string
  validation {
    condition     = contains(["standard", "premium", "trial"], var.dbx_sku)
    error_message = "The db_create_mode must be \"standard\",\"premium\", or \"trial\"."
  }
  default = "premium"
}

variable "dbx_no_public_ip" {
  description = "Are public IP Addresses not allowed? Possible values are true or false. Defaults to false."
  type        = bool
  default     = false
}

variable "dbx_public_network_access_enabled" {
  description = "Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true."
  type        = bool
  default     = true
}

variable "dbx_network_security_group_rules_required" {
  description = " Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly? Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules. Required when public_network_access_enabled is set to false."
  type        = string
  validation {
    condition     = contains(["AllRules", "NoAzureDatabricksRules", "NoAzureServiceRules"], var.dbx_network_security_group_rules_required)
    error_message = "The db_create_mode must be \"AllRules\",\"NoAzureDatabricksRules\", or \"NoAzureServiceRules\"."
  }
  default = "AllRules"
}

variable "tags" {
  description = "Tags to apply to the Databricks Workspace"
  type        = map(string)
  default = {
    name     = "shreejan.mistry@intel.com",
    duration = "4"
    /* "owner"    = "user@example.com"
    "module"   = "Intel-Cloud-Optimization-Module" */
  }
}