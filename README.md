<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Azure Databricks
The module can deploy an Intel Optimized Azure Databricks Workspace and Cluster. Instance Selection and Intel Optimizations have been defaulted in the code.

**Learn more about optimizations :**

[Databricks Photon using Azure Edsv5](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

[Accelerating Databricks Runtime for Machine Learning](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273)

## Usage


See examples folder for code ./examples/terraform-intel-azure-databricks/main.tf

Example of main.tf

```hcl
# Provision Intel Cloud Optimization Module

module "module-example" {
  source                  = "intel/azure-databricks/intel"
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
