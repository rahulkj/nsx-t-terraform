data "nsxt_edge_cluster" "edge_cluster" {
  display_name = var.edge_cluster_name
}

data "nsxt_transport_zone" "vlan_tz" {
  display_name = var.transport_zone_vlan_name
}

data "nsxt_transport_zone" "overlay_tz" {
  display_name = var.transport_zone_overlay_name
}

