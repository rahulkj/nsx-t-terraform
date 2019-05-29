variable "env_name" {}

variable "edge_cluster_name" {}
variable "transport_zone_vlan_name" {}
variable "transport_zone_overlay_name" {}

variable "router_t0" {}
variable "pks_snat_ip_pool_name" {}
variable "pks_snat_ip_pool_range" {}
variable "pks_snat_ip_pool_cidr" {}

variable "pks_ls" {}
variable "pks_subnet_cidr" {}

variable "pks_api_private_ip" {}
variable "pks_public_ip" {}

variable "pks_pods_ip_block_name" {}
variable "pks_pods_ip_block_cidr" {}

variable "pks_nodes_ip_block_name" {}
variable "pks_nodes_ip_block_cidr" {}
