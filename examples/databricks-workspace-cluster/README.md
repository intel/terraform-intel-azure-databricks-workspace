<p align="center">
  <img src="https://github.com/intel/terraform-intel-azure-databricks/blob/main/images/logo-classicblue-800px.png?raw=true" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform

© Copyright 2022, Intel Corporation

## Azure Databricks
The module can deploy an Intel Optimized Azure Databricks Workspace

**Learn more about optimizations :**

[Databricks Photon using Azure Edsv5](https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html)

[Accelerating Databricks Runtime for Machine Learning](https://techcommunity.microsoft.com/t5/ai-customer-engineering-team/accelerating-azure-databricks-runtime-for-machine-learning/ba-p/3524273)

## Usage


See examples folder for code ./examples/terraform-intel-azure-databricks/main.tf.

This example showcases how to use the [Intel Optimized Databricks Cluster](https://registry.terraform.io/modules/intel/databricks-cluster/intel/latest) with the given Intel Optimized Azure Databricks Workspace Module.

* **Prerequisites:**

  1.  Configure the **providers.tf** like shown in this example. It is important to configure both providers as Databricks Workspace and Cluster use seperate providers to deploy resources. Also see how to use the **databricks.cluster** provider for the Databricks Cluster module in example/main.tf

  2.  See the main.tf in the example on how to pass the value for dbx_host (i.e. the URL of the databricks workspace) in the Databricks Cluster Module 

  3.  Example of main.tf

        ```hcl
        # Provision Intel Cloud Optimization Module for Azure Databricks

        module "module-example" {
            source                  = "intel/azure-databricks/intel"
            resource_group_name     = <"ENTER_YOUR_RESOURCE_GROUP_NAME">                #Required. 
            dbx_workspace_name      = <"NAME_YOUR_DATABRICKS_WORKSPACE">                #Required. 
        }

        # This example creates databricks cluster on your azure dbx workspace created above.

        module "databricks_cluster" {
            source     = "../../"
            dbx_host   = module.module-example.dbx_workspace_url       #Required
            dbx_cloud  = "azure"                                       #Required

            depends_on = [ module.module-example ]
            providers  = { databricks = databricks.cluster }
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
