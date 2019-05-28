resource "nsxt_logical_switch" "pks" {
  admin_state       = "UP"
  description       = "LS created by Terraform"
  display_name      = "${var.pks_ls}"
  transport_zone_id = "${data.nsxt_transport_zone.overlay_tz.id}"
  replication_mode  = "MTEP"
}

resource "nsxt_logical_tier1_router" "pks_t1" {
  description                 = "Tier1 router provisioned by Terraform"
  display_name                = "${var.pks_ls}-T1"
  failover_mode               = "PREEMPTIVE"
  edge_cluster_id             = "${data.nsxt_edge_cluster.edge_cluster.id}"
  enable_router_advertisement = true
  advertise_connected_routes  = true
  advertise_static_routes     = false
  advertise_nat_routes        = false
  advertise_lb_vip_routes     = true
}

resource "nsxt_logical_router_link_port_on_tier0" "link_port_tier0_pks" {
  description       = "TIER0_PORT1 provisioned by Terraform"
  display_name      = "${var.router_t0}-TO-${var.pks_ls}-T1-t0_lrp"
  logical_router_id = "${data.nsxt_logical_tier0_router.t0_router.id}"
}

resource "nsxt_logical_router_link_port_on_tier1" "link_port_tier1_pks" {
  description                   = "TIER1_PORT1 provisioned by Terraform"
  display_name                  = "${var.router_t0}-TO-${var.pks_ls}-T1-t1_lrp"
  logical_router_id             = "${nsxt_logical_tier1_router.pks_t1.id}"
  linked_logical_router_port_id = "${nsxt_logical_router_link_port_on_tier0.link_port_tier0_pks.id}"
}

resource "nsxt_logical_port" "logical_port1_pks" {
  admin_state       = "UP"
  description       = "LP1 provisioned by Terraform"
  display_name      = "LP1"
  logical_switch_id = "${nsxt_logical_switch.pks.id}"
}

resource "nsxt_logical_router_downlink_port" "downlink_port_pks" {
  description                   = "DP1 provisioned by Terraform"
  display_name                  = "PAS"
  logical_router_id             = "${nsxt_logical_tier1_router.pks_t1.id}"
  linked_logical_switch_port_id = "${nsxt_logical_port.logical_port1_pks.id}"
  ip_address                    = "${var.pks_subnet_cidr}"
}
