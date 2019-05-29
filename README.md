---
## What does this repository provide?
Terraform scripts that prepares the NSX-T environment for deploying OpsManager, PAS and PKS

## Pre-requisites:
* Use terraform 0.11.14
* Prepare the hosts
* Deploy the edges and edge cluster
* Fill in the details in `terraform.tfvars`

## What happens upon terraforming?

> `terraform init`

> `terraform plan -out=plan1`

> `terraform apply plan1`

When the `apply` is executed, the following objects are created and tagged:

- T0 Router (and tagged)
- 4 T1 Routers (one for each INFRASTRUCTURE, DEPLOYMENT, SERVICES, PKS)
- 5 Segments (Switches) (one for each INFRASTRUCTURE, DEPLOYMENT, SERVICES, PKS)
- External IP Pools for
  - SNAT for PAS (and tagged)
  - SNAT for PKS
- NAT Rules
  - SNAT private CIDR's to external
  - DNAT to OpsManager
  - DNAT to PKS API
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

## Post terraform
* You need to create the `UPLINK` port and attach to the T0 router and all the NAT rules (feature gap with current NSX-T Terraform)
