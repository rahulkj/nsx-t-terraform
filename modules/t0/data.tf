data "nsxt_policy_edge_cluster" "edge_cluster" {
  display_name = var.edge_cluster
}

data "nsxt_policy_transport_zone" "vlan_tz" {
  display_name = var.vlan_tz
}

data "nsxt_policy_edge_node" "edge_node" {
  edge_cluster_path = data.nsxt_policy_edge_cluster.edge_cluster.path
  member_index      = 0
}
