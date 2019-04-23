provider "nsxt" {
  host                     = "${var.nsx_hostname}"
  username                 = "${var.nsx_user}"
  password                 = "${var.nsx_password}"
  allow_unverified_ssl     = true
  max_retries              = 10
  retry_min_delay          = 500
  retry_max_delay          = 5000
  retry_on_status_codes    = [429]
}

module "modules" {
  source = "./modules"

  env_name                      = "${var.env_name}"

  edge_cluster_name             = "${var.edge_cluster_name}"
  transport_zone_vlan_name      = "${var.transport_zone_vlan_name}"
  transport_zone_overlay_name   = "${var.transport_zone_overlay_name}"

  pcf_ip_block_name             = "${var.pcf_ip_block_name}"
  pcf_ip_block_cidr             = "${var.pcf_ip_block_cidr}"
  external_snat_ip_pool_name    = "${var.external_snat_ip_pool_name}"
  external_snat_ip_pool_range   = "${var.external_snat_ip_pool_range}"
  external_snat_ip_pool_cidr    = "${var.external_snat_ip_pool_cidr}"
  infrastructure_ls             = "${var.infrastructure_ls}"
  pas_ls                        = "${var.pas_ls}"
  services_ls                   = "${var.services_ls}"

  infrastructure_subnet_cidr    = "${var.infrastructure_subnet_cidr}"
  pas_subnet_cidr               = "${var.pas_subnet_cidr}"
  services_subnet_cidr          = "${var.services_subnet_cidr}"
  router_t0                     = "${var.router_t0}"
  uplink_router_ip              = "${var.uplink_router_ip}"
  static_route_next_hop_ip      = "${var.static_route_next_hop_ip}"
}
