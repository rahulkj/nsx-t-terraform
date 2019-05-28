variable "env_name" {}

variable "nsx_hostname" {}
variable "nsx_user" {}
variable "nsx_password" {}

variable "edge_cluster_name" {}
variable "transport_zone_vlan_name" {}
variable "transport_zone_overlay_name" {}

variable "pcf_ip_block_name" {
  type = "string"
  default = "pcf_ip_block"
}

variable "pcf_ip_block_cidr" {}

variable "pas_snat_ip_pool_name" {}
variable "pas_snat_ip_pool_range" {}
variable "pas_snat_ip_pool_cidr" {}

variable "pks_snat_ip_pool_name" {}
variable "pks_snat_ip_pool_range" {}
variable "pks_snat_ip_pool_cidr" {}

variable "infrastructure_ls" {}
variable "pas_ls" {}
variable "services_ls" {}
variable "pks_ls" {}

variable "infrastructure_subnet_cidr" {}
variable "pas_subnet_cidr" {}
variable "services_subnet_cidr" {}
variable "pks_subnet_cidr" {}

variable "router_t0" {}
variable "uplink_router_ip" {}
variable "static_route_next_hop_ip" {}

variable "router_server_pool_name" {}
variable "diego_brain_server_pool_name" {}
variable "istio_server_pool_name" {}

variable "ops_manager_private_ip" {}
variable "opsmanager_public_ip" {}
variable "pas_routers_public_ip" {}
variable "pas_diego_brains_public_ip" {}
variable "pas_istio_public_ip" {}

variable "snat_public_ip" {}
variable "snat_cidr" {}

variable "pks_api_private_ip" {}
variable "pks_public_ip" {}
