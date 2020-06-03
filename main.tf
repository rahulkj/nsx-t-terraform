provider "nsxt" {
  host                  = var.nsx_manager
  username              = var.nsx_username
  password              = var.nsx_password
  allow_unverified_ssl  = true
  max_retries           = 10
  retry_min_delay       = 500
  retry_max_delay       = 5000
  retry_on_status_codes = [429]
}

module "t0_gateway" {
  source = "./modules/t0"

  edge_cluster              = var.edge_cluster
  vlan_tz                   = var.vlan_tz
  t0_gateway_name           = var.t0_gateway
  static_route_network_cidr = var.static_route_network_cidr
  static_route_next_hop     = var.static_route_next_hop
  t0_segment_name           = var.t0_segment
  vlan_ids                  = var.vlan_ids
  t0_gateway_interface_name = var.t0_gateway_interface_name
  t0_gateway_ip_addresses   = var.t0_gateway_ip_addresses
}

module "t1_gateway_infra" {
  source = "./modules/t1"

  edge_cluster    = var.edge_cluster
  t0_gateway_path = module.t0_gateway.path
  overlay_tz      = var.overlay_tz
  t1_gateway_name = var.t1_gateway_infra
  t1_gateway_cidr = var.t1_gateway_infra_cidr
}

module "t1_gateway_tas" {
  source = "./modules/t1"

  edge_cluster    = var.edge_cluster
  t0_gateway_path = module.t0_gateway.path
  overlay_tz      = var.overlay_tz
  t1_gateway_name = var.t1_gateway_tas
  t1_gateway_cidr = var.t1_gateway_tas_cidr
}

module "t1_gateway_services" {
  source = "./modules/t1"

  edge_cluster    = var.edge_cluster
  t0_gateway_path = module.t0_gateway.path
  overlay_tz      = var.overlay_tz
  t1_gateway_name = var.t1_gateway_services
  t1_gateway_cidr = var.t1_gateway_services_cidr
}

module "t1_gateway_tkgi" {
  source = "./modules/t1"

  edge_cluster    = var.edge_cluster
  t0_gateway_path = module.t0_gateway.path
  overlay_tz      = var.overlay_tz
  t1_gateway_name = var.t1_gateway_tkgi
  t1_gateway_cidr = var.t1_gateway_tkgi_cidr
}

module "snat_rule" {
  source = "./modules/snat"

  t0_gateway_path = module.t0_gateway.path
  rule_name       = var.snat_rule_name
  cidr            = var.snat_cidr
  public_ip       = var.snat_public_ip
}

module "opsmanager_dnat_rule" {
  source = "./modules/dnat"

  t0_gateway_path = module.t0_gateway.path
  rule_name       = var.opsmanager_dnat_rule_name
  public_ip       = var.opsmanager_public_ip
  private_ip      = var.opsmanager_private_ip
}

module "tkgi_dnat_rule" {
  source = "./modules/dnat"

  t0_gateway_path = module.t0_gateway.path
  rule_name       = var.tkgi_dnat_rule_name
  public_ip       = var.tkgi_public_ip
  private_ip      = var.tkgi_api_private_ip
}

module "harbor_dnat_rule" {
  source = "./modules/dnat"

  t0_gateway_path = module.t0_gateway.path
  rule_name       = var.harbor_dnat_rule_name
  public_ip       = var.harbor_public_ip
  private_ip      = var.harbor_private_ip
}

module "tas_ip_block" {
  source = "./modules/ip-block"

  ip_block_name = var.tas_ip_block_name
  ip_block_cidr = var.tas_ip_block_cidr
}

module "tkgi_nodes_ip_block" {
  source = "./modules/ip-block"

  ip_block_name = var.tkgi_nodes_ip_block_name
  ip_block_cidr = var.tkgi_nodes_ip_block_cidr
}

module "tkgi_pods_ip_block" {
  source = "./modules/ip-block"

  ip_block_name = var.tkgi_pods_ip_block_name
  ip_block_cidr = var.tkgi_pods_ip_block_cidr
}

module "tas_snat_ip_pool" {
  source = "./modules/ip-pool"

  ip_pool_name        = var.tas_snat_ip_pool_name
  ip_pool_cidr        = var.tas_snat_ip_pool_cidr
  ip_pool_gateway     = var.tas_snat_ip_pool_gateway
  ip_pool_range_start = var.tas_snat_ip_pool_range_start
  ip_pool_range_end   = var.tas_snat_ip_pool_range_end
}

module "tkgi_snat_ip_pool" {
  source = "./modules/ip-pool"

  ip_pool_name        = var.tkgi_snat_ip_pool_name
  ip_pool_cidr        = var.tkgi_snat_ip_pool_cidr
  ip_pool_gateway     = var.tkgi_snat_ip_pool_gateway
  ip_pool_range_start = var.tkgi_snat_ip_pool_range_start
  ip_pool_range_end   = var.tkgi_snat_ip_pool_range_end
}

module "workload_lb" {
  source = "./modules/loadbalancer"

  lb_name         = var.workload_lb_name
  lb_type         = var.workload_lb_type
  t1_gateway_path = module.t1_gateway_infra.path
}

module "routers_nsgroups_pool_virtualserver" {
  source = "./modules/nsgroups-pool-virtualserver"

  ns_group_name           = var.router_ns_group_name
  server_pool_name        = var.router_server_pool_name
  public_ip               = var.router_public_ip
  ports                   = ["443"]
  lb_path                 = module.workload_lb.path
  app_profile             = var.router_lb_application_profile
  active_lb_monitor_name  = var.router_active_lb_monitor_name
  passive_lb_monitor_name = var.router_passive_lb_monitor_name
}

module "diego_brains_nsgroups_pool_virtualserver" {
  source = "./modules/nsgroups-pool-virtualserver"

  ns_group_name           = var.diego_brain_ns_group_name
  server_pool_name        = var.diego_brain_server_pool_name
  public_ip               = var.diego_brain_public_ip
  ports                   = ["2222"]
  lb_path                 = module.workload_lb.path
  app_profile             = var.diego_brain_lb_application_profile
  active_lb_monitor_name  = var.diego_brain_active_lb_monitor_name
  passive_lb_monitor_name = var.diego_brain_passive_lb_monitor_name
}

module "istio_routers_nsgroups_pool_virtualserver" {
  source = "./modules/nsgroups-pool-virtualserver"

  ns_group_name           = var.istio_router_ns_group_name
  server_pool_name        = var.istio_router_server_pool_name
  public_ip               = var.istio_router_server_public_ip
  ports                   = ["443"]
  lb_path                 = module.workload_lb.path
  app_profile             = var.istio_router_lb_application_profile
  active_lb_monitor_name  = var.istio_router_active_lb_monitor_name
  passive_lb_monitor_name = var.istio_router_passive_lb_monitor_name
}