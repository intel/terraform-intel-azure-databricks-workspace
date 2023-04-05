<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module

## Policy 1

Description: Intel Xeon 3rd Generation Scalable processors (code-named Ice Lake) should be used

Resource type: databricks_cluster

Parameter: node_type_id

Allowed Types

- **Memory Optimized:** Standard_E4ds_v5, Standard_E8ds_v5, Standard_E16ds_v5, Standard_E20ds_v5, Standard_E32ds_v5, Standard_E48ds_v5, Standard_E64ds_v5, Standard_E96ds_v5

## Policy 2  

Description: Provisioned PHOTON runtime engine should be used for enhanced performance

Resource type: databricks_cluster

Parameter: runtime_engine

Allowed Type: PHOTON

## Policy 3  

Description: databricks_cluster

Resource type: databricks_cluster

Parameter: spark_conf

Allowed Type: map(string) #(Cannot be null)

## Links

<https://learn.microsoft.com/en-us/azure/virtual-machines/edv5-edsv5-series>

<https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html>

<https://www.databricks.com/product/pricing>