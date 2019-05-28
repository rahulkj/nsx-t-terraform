---
## What does this repository provide?
Terraform scripts that prepares the NSX-T environment for deploying OpsManager, PAS and PKS

## Pre-requisites:
* Use terraform 0.11.14
* Prepare the hosts
* Deploy the edges and edge cluster
* Fill in the details in `terraform.tfvars`

## Post terraform
* You need to create the `UPLINK` port and attach to the T0 router and all the NAT rules (feature gap with current NSX-T Terraform)
