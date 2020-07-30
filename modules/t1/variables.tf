variable "edge_cluster" {}
variable "t0_gateway_path" {}
variable "overlay_tz" {}
variable "t1_gateway_name" {}
variable "t1_gateway_cidr" {
  type = list(string)
}
