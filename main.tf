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

module "pas" {
  source = "./modules/pas"

  env_name                      = "${var.env_name}"

  edge_cluster_name             = "${var.edge_cluster_name}"
  transport_zone_vlan_name      = "${var.transport_zone_vlan_name}"
  transport_zone_overlay_name   = "${var.transport_zone_overlay_name}"

  pcf_ip_block_name             = "${var.pcf_ip_block_name}"
  pcf_ip_block_cidr             = "${var.pcf_ip_block_cidr}"
  pas_snat_ip_pool_name         = "${var.pas_snat_ip_pool_name}"
  pas_snat_ip_pool_range        = "${var.pas_snat_ip_pool_range}"
  pas_snat_ip_pool_cidr         = "${var.pas_snat_ip_pool_cidr}"

  infrastructure_ls             = "${var.infrastructure_ls}"
  pas_ls                        = "${var.pas_ls}"
  services_ls                   = "${var.services_ls}"

  infrastructure_subnet_cidr    = "${var.infrastructure_subnet_cidr}"
  pas_subnet_cidr               = "${var.pas_subnet_cidr}"
  services_subnet_cidr          = "${var.services_subnet_cidr}"
  router_t0                     = "${var.router_t0}"
  uplink_router_ip              = "${var.uplink_router_ip}"
  static_route_next_hop_ip      = "${var.static_route_next_hop_ip}"

  loadbalancer_type             = "${var.loadbalancer_type}"

  router_server_pool_name       = "${var.router_server_pool_name}"
  diego_brain_server_pool_name  = "${var.diego_brain_server_pool_name}"
  istio_server_pool_name        = "${var.istio_server_pool_name}"

  ops_manager_private_ip        = "${var.ops_manager_private_ip}"
  opsmanager_public_ip          = "${var.opsmanager_public_ip}"
  pas_routers_public_ip         = "${var.pas_routers_public_ip}"
  pas_diego_brains_public_ip    = "${var.pas_diego_brains_public_ip}"
  pas_istio_public_ip           = "${var.pas_istio_public_ip}"

  snat_public_ip                = "${var.snat_public_ip}"
  snat_cidr                     = "${var.snat_cidr}"
}

module "pks" {
  source = "./modules/pks"

  env_name                      = "${var.env_name}"

  edge_cluster_name             = "${var.edge_cluster_name}"
  transport_zone_vlan_name      = "${var.transport_zone_vlan_name}"
  transport_zone_overlay_name   = "${var.transport_zone_overlay_name}"

  router_t0                     = "${module.pas.router_t0}"

  pks_snat_ip_pool_name         = "${var.pks_snat_ip_pool_name}"
  pks_snat_ip_pool_range        = "${var.pks_snat_ip_pool_range}"
  pks_snat_ip_pool_cidr         = "${var.pks_snat_ip_pool_cidr}"

  pks_ls                        = "${var.pks_ls}"
  pks_subnet_cidr               = "${var.pks_subnet_cidr}"

  pks_api_private_ip            = "${var.pks_api_private_ip}"
  pks_public_ip                 = "${var.pks_public_ip}"
}
