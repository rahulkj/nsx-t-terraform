NSX-T terraform
---
## What does this repository provide?
Terraform scripts that prepares the NSX-T environment for deploying OSS Concourse, OpsManager, TAS, TKG and TKGI

## Pre-requisites:
* Use terraform > 0.11.xx
* Prepare the hosts
* Deploy the edges and edge cluster
* Fill in the details in `terraform.tfvars`
* Create the Load Balancer Active Monitors, Networking > Load Balancing > Monitors > Add Active Monitors

  | TYPE | NAME | MONITORING PORT |
  | -- | -- | -- |
  | `TCP` | `ROUTERS` | 8080 |
  | `TCP` | `DIEGO_BRAINS` | 2222 |
  | `TCP` | `ISTIO_ROUTERS` | 8080 |

## What happens upon terraforming?

```
go get -u github.com/terraform-providers/terraform-provider-nsxt

go install github.com/terraform-providers/terraform-provider-nsxt

terraform init

cp $GOBIN/terraform-provider-nsxt .terraform/plugins/darwin_amd64/terraform-provider-nsxt_v2.1.1_x4

terraform init

terraform plan -out=nsx

terraform apply "nsx"
```

When the `apply` is executed, the following objects are created and tagged:

- T0 Gateway (and tagged)
- 6 T1 Gateway (one for each AUTOMATION, INFRASTRUCTURE, DEPLOYMENT, SERVICES, TKGI, TKG)
- 7 Segments (Switches) (one for each AUTOMATION, INFRASTRUCTURE, DEPLOYMENT, SERVICES, TKGI, TKG, UPLINKS)
- External IP Pools for
  - SNAT for TAS
  - SNAT for TKGI
- NAT Rules
  - SNAT private CIDR's to external
  - DNAT to OpsManager VM
  - DNAT to TKGI API
  - DNAT to Harbor API
  - DNAT to Jumpbox VM
  - DNAT to Concourse Web
- Segment profiles (and tagged)
- 1 Small load balancer
- 3 Virtual Servers
  - GoRouters
  - Diego Brains
  - Istio Routers
- 3 Server Pools, without members and using AutoMap
  - GoRouters (monitor port 8080)
  - Diego Brains (monitor port 2222)
  - Istio Routers (monitor port 8080)