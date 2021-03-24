resource "nsxt_policy_tier0_gateway" "t0_gateway" {
  description          = "Tier-0 ${var.t0_gateway_name} provisioned by Terraform"
  display_name         = var.t0_gateway_name
  failover_mode        = "PREEMPTIVE"
  default_rule_logging = false
  enable_firewall      = true
  ha_mode              = "ACTIVE_STANDBY"
  edge_cluster_path    = data.nsxt_policy_edge_cluster.edge_cluster.path
}

resource "nsxt_policy_static_route" "static_route" {
  display_name = "SR"
  gateway_path = nsxt_policy_tier0_gateway.t0_gateway.path
  network      = var.static_route_network_cidr

  next_hop {
    admin_distance = "1"
    ip_address     = var.static_route_next_hop
  }
}

resource "nsxt_policy_vlan_segment" "t0_segment" {
  display_name        = var.t0_segment_name
  description         = "${var.t0_segment_name} Terraform provisioned VLAN Segment"
  transport_zone_path = data.nsxt_policy_transport_zone.vlan_tz.path
  vlan_ids            = var.vlan_ids

  advanced_config {
    connectivity = "ON"
    local_egress = true
  }
}

resource "nsxt_policy_tier0_gateway_interface" "t0_gateway_interface" {
  display_name   = var.t0_gateway_interface_name
  description    = "${var.t0_gateway_interface_name} connection to segment0"
  type           = "EXTERNAL"
  gateway_path   = nsxt_policy_tier0_gateway.t0_gateway.path
  segment_path   = nsxt_policy_vlan_segment.t0_segment.path
  subnets        = var.t0_gateway_ip_addresses
  mtu            = 9000
  edge_node_path = data.nsxt_policy_edge_node.edge_node.path
}
