env_name                        = # Example: "pcf"
nsx_hostname                    = # Example: "nsx.somelab.io"
nsx_user                        = # Example: "admin"
nsx_password                    = # Example: "password"

pcf_ip_block_name               = "pcf-ip-block"
pcf_ip_block_cidr               = "192.168.32.0/19"

pas_snat_ip_pool_name           = "pcf-floating-ip-pool"
pas_snat_ip_pool_range          = "10.0.1.35-10.0.1.45"
pas_snat_ip_pool_cidr           = "10.0.0.0/23"

pks_snat_ip_pool_name           = "pks-floating-ip-pool"
pks_snat_ip_pool_range          = "10.0.1.46-10.0.1.55"
pks_snat_ip_pool_cidr           = "10.0.0.0/23"

router_t0                       = "ROUTER-T0"
infrastructure_ls               = "INFRASTRUCTURE"
pas_ls                          = "DEPLOYMENT"
services_ls                     = "SERVICES"
pks_ls                          = "PKS"

uplink_router_ip                = "10.0.1.10/23"
static_route_next_hop_ip        = "10.0.0.1"
infrastructure_subnet_cidr      = "192.168.10.1/26"
pas_subnet_cidr                 = "192.168.12.1/23"
services_subnet_cidr            = "192.168.14.1/23"
pks_subnet_cidr                 = "192.168.16.1/23"

edge_cluster_name               = "edge-cluster"
transport_zone_vlan_name        = "tz-vlan"
transport_zone_overlay_name     = "tz-overlay"

loadbalancer_type               = "SMALL" # SMALL | MEDIUM | LARGE

router_server_pool_name         = "RouterServerPool"
diego_brain_server_pool_name    = "DiegoBrainServerPool"
istio_server_pool_name          = "IstioServerPool"

ops_manager_private_ip          = "192.168.10.10"
opsmanager_public_ip            = "10.0.1.30"
pas_routers_public_ip           = "10.0.1.31"
pas_diego_brains_public_ip      = "10.0.1.31"
pas_istio_public_ip             = "10.0.1.32"

snat_public_ip                  = "10.0.1.25"
snat_cidr                       = "192.168.0.0/16"

pks_api_private_ip              = "192.168.16.11"
pks_public_ip                   = "10.0.1.33"
