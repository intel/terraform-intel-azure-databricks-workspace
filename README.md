<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-databricks-workspace/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Azure Databricks
The module can deploy an Intel Optimized Azure Databricks Workspace.

**Learn more about optimizations :**
## Performance Data

<center>

#### [Reduce Time to Decision With the Databricks Lakehouse Platform and Latest Intel 3rd Gen Xeon Scalable Processors](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

<p align="center">
  <a href="https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html">
  <img src="https://github.com/intel/terraform-intel-azure-databricks-workspace/blob/main/images/azure-dbx-1.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
#### [Up to 3.0x price/performance benefits and 6.7x the speed up on Azure Edsv5](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

<p align="center">
  <a href="https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html">
  <img src="https://github.com/intel/terraform-intel-azure-databricks-workspace/blob/main/images/azure-dbx-2.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#
#### [Accelerating Azure Databricks Runtime for Machine Learning](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273)

<p align="center">
  <a href="https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273">
  <img src="https://github.com/intel/terraform-intel-azure-databricks-workspace/blob/main/images/dbx-runtime.png?raw=true" alt="Link" width="600"/>
  </a>
</p>

#

</center>


## Usage


See examples folder for code ./examples/terraform-intel-azure-databricks/main.tf

Example of main.tf

```hcl
# Provision Intel Cloud Optimization Module

module "module-example" {
  source                  = "intel/azure-databricks-workspace/intel"
  resource_group_name     = <"ENTER_YOUR_RESOURCE_GROUP_NAME">                #Required. Enter an pre-existing resource group you want Azure Databricks Workspace to deploy in
  dbx_workspace_name      = <"NAME_YOUR_DATABRICKS_WORKSPACE">                #Required. Enter a name for your Azure Databricks Workspace

}
```

Run Terraform

```hcl
terraform init  
terraform plan
terraform apply

```

Note that this example may create resources. Run `terraform destroy` when you don't need these resources anymore.

## Considerations

More Information regarding deploying [Azure Databricks Workspace](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace)

More Information regarding deploying and [Managing Databricks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace)
  
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.48 |
| <a name="requirement_databricks"></a> [databricks](#requirement\_databricks) | ~> 1.14.2 |
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.4.3 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 3.48 |
| <a name="provider_databricks"></a> [databricks](#provider\_databricks) | ~> 1.14.2 |
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.4.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_databricks_workspace.az-databricks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/databricks_workspace) | resource |
| [databricks_global_init_script.intel_optimized_script](https://registry.terraform.io/providers/databricks/databricks/latest/docs/resources/global_init_script) | resource |
| [random_string.naming](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [azurerm_resource_group.databricks](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
| [azurerm_subnet.dbx-private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_subnet.dbx-public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subnet) | data source |
| [azurerm_virtual_network.dbx-vnet](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dbx_network_security_group_rules_required"></a> [dbx\_network\_security\_group\_rules\_required](#input\_dbx\_network\_security\_group\_rules\_required) | Does the data plane (clusters) to control plane communication happen over private link endpoint only or publicly? Possible values AllRules, NoAzureDatabricksRules or NoAzureServiceRules. Required when public\_network\_access\_enabled is set to false. | `string` | `"AllRules"` | no |
| <a name="input_dbx_no_public_ip"></a> [dbx\_no\_public\_ip](#input\_dbx\_no\_public\_ip) | Are public IP Addresses not allowed? Possible values are true or false. Defaults to false. | `bool` | `false` | no |
| <a name="input_dbx_private_subnet"></a> [dbx\_private\_subnet](#input\_dbx\_private\_subnet) | Name of the private subnet in your virtual network for your Databricks worskpace. Required only if you like to use your own virtual network else it will be on a databricks network | `string` | `""` | no |
| <a name="input_dbx_public_network_access_enabled"></a> [dbx\_public\_network\_access\_enabled](#input\_dbx\_public\_network\_access\_enabled) | Allow public access for accessing workspace. Set value to false to access workspace only via private link endpoint. Possible values include true or false. Defaults to true. | `bool` | `true` | no |
| <a name="input_dbx_public_subnet"></a> [dbx\_public\_subnet](#input\_dbx\_public\_subnet) | Name of the public subnet in your virtual network for your Databricks worskpace. Required only if you like to use your own virtual network else it will be on a databricks network | `string` | `""` | no |
| <a name="input_dbx_sku"></a> [dbx\_sku](#input\_dbx\_sku) | The sku to use for the Databricks Workspace. Possible values are standard, premium, or trial. | `string` | `"premium"` | no |
| <a name="input_dbx_vnet"></a> [dbx\_vnet](#input\_dbx\_vnet) | Name of the virtual network for your Databricks worskpace. Required only if you like to use your own virtual network else it will be on a databricks network | `string` | `""` | no |
| <a name="input_dbx_workspace_name"></a> [dbx\_workspace\_name](#input\_dbx\_workspace\_name) | Name of the databricks workspace that will be created. | `string` | n/a | yes |
| <a name="input_enable_intel_tags"></a> [enable\_intel\_tags](#input\_enable\_intel\_tags) | If true adds additional Intel tags to resources | `bool` | `true` | no |
| <a name="input_intel_tags"></a> [intel\_tags](#input\_intel\_tags) | Intel Tags | `map(string)` | <pre>{<br>  "intel-module": "terraform-intel-azure-databricks-workspace",<br>  "intel-registry": "https://registry.terraform.io/namespaces/intel"<br>}</pre> | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Existing Resource Group where databricks reosurce will be created. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the Databricks Workspace | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dbx_custom_parameters"></a> [dbx\_custom\_parameters](#output\_dbx\_custom\_parameters) | Custom parameter block of the databricks workspace |
| <a name="output_dbx_location"></a> [dbx\_location](#output\_dbx\_location) | Location of the databricks workspace |
| <a name="output_dbx_network_security_group_rules_required"></a> [dbx\_network\_security\_group\_rules\_required](#output\_dbx\_network\_security\_group\_rules\_required) | NSG outbound rules of the databricks workspace |
| <a name="output_dbx_public_network_access_enabled"></a> [dbx\_public\_network\_access\_enabled](#output\_dbx\_public\_network\_access\_enabled) | Public Network access enabled of the databricks workspace |
| <a name="output_dbx_resource_group_name"></a> [dbx\_resource\_group\_name](#output\_dbx\_resource\_group\_name) | Name of the Resource group of databricks workspace |
| <a name="output_dbx_sku"></a> [dbx\_sku](#output\_dbx\_sku) | Sku tier of the databricks workspace |
| <a name="output_dbx_workspace_name"></a> [dbx\_workspace\_name](#output\_dbx\_workspace\_name) | Name of the databricks workspace |
| <a name="output_dbx_workspace_url"></a> [dbx\_workspace\_url](#output\_dbx\_workspace\_url) | URL of the databricks workspace |
<!-- END_TF_DOCS -->