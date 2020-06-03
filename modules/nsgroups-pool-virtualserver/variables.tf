variable "ns_group_name" {}
variable "server_pool_name" {}
variable "public_ip" {}
variable "ports" {
  type = list(string)
}
variable "lb_path" {}
variable "app_profile" {}
variable "active_lb_monitor_name" {}
variable "passive_lb_monitor_name" {}