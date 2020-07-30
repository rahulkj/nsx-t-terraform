variable "edge_cluster" {}
variable "vlan_tz" {}
variable "t0_gateway_name" {}
variable "static_route_network_cidr" {}
variable "static_route_next_hop" {}
variable "t0_segment_name" {}
variable "vlan_ids" {
  type = list(string)
}
variable "t0_gateway_interface_name" {}
variable "t0_gateway_ip_addresses" {
  type = list(string)
}