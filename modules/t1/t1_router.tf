resource "nsxt_policy_tier1_gateway" "t1_gateway" {
  display_name              = "${var.t1_gateway_name}-T1"
  description               = "${var.t1_gateway_name}-T1 Tier1 provisioned by Terraform"
  edge_cluster_path         = data.nsxt_policy_edge_cluster.edge_cluster.path
  failover_mode             = "PREEMPTIVE"
  default_rule_logging      = "false"
  enable_firewall           = "true"
  enable_standby_relocation = "false"
  tier0_path                = var.t0_gateway_path
  route_advertisement_types = ["TIER1_STATIC_ROUTES", "TIER1_LB_VIP", "TIER1_CONNECTED"]
}

resource "nsxt_policy_segment" "t1_segment" {
  display_name        = var.t1_gateway_name
  description         = "${var.t1_gateway_name} Terraform provisioned Segment"
  transport_zone_path = data.nsxt_policy_transport_zone.overlay_tz.path

  advanced_config {
    connectivity = "ON"
    local_egress = true
  }
}

resource "nsxt_policy_tier1_gateway_interface" "t1_gateway_interface" {
  display_name = var.t1_gateway_name
  description  = "${var.t1_gateway_name} connection to segment1"
  gateway_path = nsxt_policy_tier1_gateway.t1_gateway.path
  segment_path = nsxt_policy_segment.t1_segment.path
  subnets      = var.t1_gateway_cidr
  mtu          = 9000
}
