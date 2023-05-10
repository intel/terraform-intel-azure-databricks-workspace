<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-databricks-workspace/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Azure Databricks
The module can deploy an Intel Optimized Azure Databricks Workspace

[Databricks Photon using Azure Edsv5](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

[Accelerating Databricks Runtime for Machine Learning](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273)

## Usage
[Steps to create Virtual Network](https://learn.microsoft.com/en-us/azure/virtual-network/quick-create-portal#create-a-virtual-network)
```
NOTE : This example assumes you have virtual network with a public and private subnet in your Azure Subscription. 
```
See examples folder for code ./examples/terraform-intel-azure-databricks/main.tf

Example of main.tf

```hcl
# Provision Intel Cloud Optimization Module

module "module-example" {
  source                  = "intel/azure-databricks-workspace/intel"
  resource_group_name     = <"ENTER_YOUR_RESOURCE_GROUP_NAME">                #Required. Enter an pre-existing resource group you want Azure Databricks Workspace to deploy in
  dbx_workspace_name      = <"NAME_YOUR_DATABRICKS_WORKSPACE">                #Required. Enter a name for your Azure Databricks Workspace
  
  #Custom (Pre-Existing) Virtual Network
  dbx_vnet                = <"ENTER_YOUR_VIRTUAL_NETWORK_NAME"> 
  dbx_public_subnet       = <"ENTER_YOUR_PUBLIC_SUBNET_NAME"> 
  dbx_private_subnet      = <"ENTER_YOUR_PRIVATE_SUBNET_NAME"> 
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
