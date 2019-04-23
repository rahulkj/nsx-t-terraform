env_name                        = "pcf"
nsx_hostname                    = ""
nsx_user                        = ""
nsx_password                    = ""

pcf_ip_block_name               = "pcf-ip-block-test"
pcf_ip_block_cidr               = "192.168.32.0/19"

external_snat_ip_pool_name      = "external_snat_ip_pool_test"
external_snat_ip_pool_range     = "10.0.1.100-10.0.1.170"
external_snat_ip_pool_cidr      = "10.0.0.0/23"

router_t0                       = "Router-T0-test"
infrastructure_ls               = "INFRA-test"
pas_ls                          = "DEPLOYMENT-test"
services_ls                     = "SERVICE-test"

uplink_router_ip                = "10.0.1.90/23"
static_route_next_hop_ip        = "10.0.0.1"
infrastructure_subnet_cidr      = "192.168.20.1/26"
pas_subnet_cidr                 = "192.168.22.1/23"
services_subnet_cidr            = "192.168.24.1/23"

edge_cluster_name               = "edge-cluster"
transport_zone_vlan_name        = "tz-vlan"
transport_zone_overlay_name     = "tz-overlay"
