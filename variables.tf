variable "nsx_manager" {}
variable "nsx_username" {}
variable "nsx_password" {}
variable "edge_cluster" {}
variable "overlay_tz" {}
variable "vlan_tz" {}
variable "t0_gateway" {}
variable "t0_gateway_interface_name" {}
variable "t0_gateway_ip_addresses" {
  type = list(string)
}
variable "static_route_network_cidr" {}
variable "static_route_next_hop" {}
variable "t0_segment" {}
variable "vlan_ids" {
  type = list(string)
}

variable "t1_gateway_infra" {}
variable "t1_gateway_infra_cidr" {
  type = list(string)
}

variable "t1_gateway_tas" {}
variable "t1_gateway_tas_cidr" {
  type = list(string)
}

variable "t1_gateway_services" {}
variable "t1_gateway_services_cidr" {
  type = list(string)
}

variable "t1_gateway_tkgi" {}
variable "t1_gateway_tkgi_cidr" {
  type = list(string)
}

variable "snat_rule_name" {}
variable "snat_cidr" {
  type = list(string)
}
variable "snat_public_ip" {
  type = list(string)
}
variable "opsmanager_dnat_rule_name" {}
variable "opsmanager_public_ip" {
  type = list(string)
}
variable "opsmanager_private_ip" {
  type = list(string)
}

variable "tas_ip_block_name" {}
variable "tas_ip_block_cidr" {}
variable "tkgi_nodes_ip_block_name" {}
variable "tkgi_nodes_ip_block_cidr" {}
variable "tkgi_pods_ip_block_name" {}
variable "tkgi_pods_ip_block_cidr" {}

variable "tas_snat_ip_pool_name" {}
variable "tas_snat_ip_pool_range_start" {}
variable "tas_snat_ip_pool_range_end" {}
variable "tas_snat_ip_pool_cidr" {}
variable "tas_snat_ip_pool_gateway" {}

variable "tkgi_snat_ip_pool_name" {}
variable "tkgi_snat_ip_pool_range_start" {}
variable "tkgi_snat_ip_pool_range_end" {}
variable "tkgi_snat_ip_pool_cidr" {}
variable "tkgi_snat_ip_pool_gateway" {}

variable "workload_lb_name" {}
variable "workload_lb_type" {}

variable "router_ns_group_name" {}
variable "router_server_pool_name" {}
variable "router_public_ip" {}
variable "router_lb_application_profile" {}
variable "router_active_lb_monitor_name" {}
variable "router_passive_lb_monitor_name" {}

variable "diego_brain_ns_group_name" {}
variable "diego_brain_server_pool_name" {}
variable "diego_brain_public_ip" {}
variable "diego_brain_lb_application_profile" {}
variable "diego_brain_active_lb_monitor_name" {}
variable "diego_brain_passive_lb_monitor_name" {}

variable "istio_router_ns_group_name" {}
variable "istio_router_server_pool_name" {}
variable "istio_router_server_public_ip" {}
variable "istio_router_lb_application_profile" {}
variable "istio_router_active_lb_monitor_name" {}
variable "istio_router_passive_lb_monitor_name" {}

variable "tkgi_dnat_rule_name" {}
variable "tkgi_api_private_ip" {
  type = list(string)
}
variable "tkgi_public_ip" {
  type = list(string)
}

variable "harbor_dnat_rule_name" {}
variable "harbor_private_ip" {
  type = list(string)
}
variable "harbor_public_ip" {
  type = list(string)
}