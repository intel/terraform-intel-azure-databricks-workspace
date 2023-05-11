<p align="center">
  <img src="./images/logo-classicblue-800px.png" alt="Intel Logo" width="250"/>
</p>

# Intel® Cloud Optimization Modules for Terraform  

© Copyright 2022, Intel Corporation

## HashiCorp Sentinel Policies

This file documents the HashiCorp Sentinel policies that apply to this module

## Policy 1  

Description: Intel Optimized ML Init Scripts

Resource type: databricks_global_init_script

Parameter: content_base64

Allowed Type: 
```
 base64encode(<<-EOT
    #!/bin/bash
    pip install --upgrade pip
    pip install intel-tensorflow==2.11.0
    pip install scikit-learn-intelex
    EOT
  )   
```
## Links

<https://www.databricks.com/product/pricing>

<https://learn.microsoft.com/en-us/azure/virtual-machines/edv5-edsv5-series>

<https://www.databricks.com/blog/2022/05/17/reduce-time-to-decision-with-the-databricks-lakehouse-platform-and-latest-intel-3rd-gen-xeon-scalable-processors.html>