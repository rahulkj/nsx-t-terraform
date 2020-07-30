data "nsxt_policy_edge_cluster" "edge_cluster" {
  display_name = var.edge_cluster
}

data "nsxt_policy_transport_zone" "vlan_tz" {
  display_name = var.vlan_tz
}