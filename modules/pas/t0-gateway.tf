resource "nsxt_vlan_logical_switch" "uplinks" {
  admin_state       = "UP"
  description       = "LS created by Terraform"
  display_name      = "UPLINKS"
  transport_zone_id = "${data.nsxt_transport_zone.vlan_tz.id}"
  vlan              = 0
}

resource "nsxt_logical_tier0_router" "t0_router" {
  display_name           = "${var.router_t0}"
  description            = "ACTIVE-STANDBY Tier0 router provisioned by Terraform"
  high_availability_mode = "ACTIVE_STANDBY"
  edge_cluster_id        = "${data.nsxt_edge_cluster.edge_cluster.id}"
}

resource "nsxt_logical_port" "logical_port1_uplinks" {
  admin_state       = "UP"
  description       = "LP-UPLINKS provisioned by Terraform"
  display_name      = "LP-UPLINKS"
  logical_switch_id = "${nsxt_vlan_logical_switch.uplinks.id}"
}

# resource "nsxt_logical_router_centralized_service_port" "downlink_port_t0" {
#   description                   = "DP1 provisioned by Terraform"
#   display_name                  = "DP1"
#   logical_router_id             = "${nsxt_logical_tier0_router.t0_router.id}"
#   linked_logical_switch_port_id = "${nsxt_logical_port.logical_port1_uplinks.id}"
#   ip_address                    = "${var.uplink_router_ip}"
# }

resource "nsxt_static_route" "static_route" {
  description       = "SR provisioned by Terraform"
  display_name      = "SR"
  logical_router_id = "${nsxt_logical_tier0_router.t0_router.id}"
  network           = "0.0.0.0/0"

  next_hop {
    ip_address              = "${var.static_route_next_hop_ip}"
    administrative_distance = "1"
    # logical_router_port_id  = "${nsxt_logical_router_centralized_service_port.downlink_port_t0.id}"
  }
}
