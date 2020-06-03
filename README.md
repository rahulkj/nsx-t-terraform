---
## What does this repository provide?
Terraform scripts that prepares the NSX-T environment for deploying OpsManager, TAS and TKGI

## Pre-requisites:
* Use terraform 0.12.xx
* Prepare the hosts
* Deploy the edges and edge cluster
* Fill in the details in `terraform.tfvars`

## What happens upon terraforming?

> `terraform init`

> `terraform plan -out=nsx`

> `terraform apply "nsx"`

When the `apply` is executed, the following objects are created and tagged:

- T0 Gateway (and tagged)
- 4 T1 Gateway (one for each INFRASTRUCTURE, DEPLOYMENT, SERVICES, TKGI)
- 5 Segments (Switches) (one for each INFRASTRUCTURE, DEPLOYMENT, SERVICES, TKGI)
- External IP Pools for
  - SNAT for TAS (and tagged)
  - SNAT for TKGI
- NAT Rules
  - SNAT private CIDR's to external
  - DNAT to OpsManager
  - DNAT to TKGI API
- Segment profiles (and tagged)
- 1 Small load balancer
- 3 Virtual Servers
  - GoRouters
  - Diego Brains
  - Istio Routers
- 3 Server Pools, without members and using AutoMap
  - GoRouters (monitor port 443)
  - Diego Brains (monitor port 2222)
  - Istio Routers (monitor port 8002)