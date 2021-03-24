resource "nsxt_policy_group" "ns_group" {
  display_name = var.ns_group_name
  description  = "${var.ns_group_name} created by Terraform"
}

resource "nsxt_policy_lb_pool" "server_pool" {
  display_name       = var.server_pool_name
  description        = "Terraform provisioned LB Pool ${var.server_pool_name}"
  algorithm          = "LEAST_CONNECTION"
  min_active_members = 1

  active_monitor_path  = data.nsxt_policy_lb_monitor.active_lb_monitor.path
  passive_monitor_path = data.nsxt_policy_lb_monitor.passive_lb_monitor.path

  snat {
    type = "AUTOMAP"
  }

  tcp_multiplexing_enabled = true
  tcp_multiplexing_number  = 8

  member_group {
    group_path = nsxt_policy_group.ns_group.path
  }
}

resource "nsxt_policy_lb_virtual_server" "virtual_server" {
  display_name               = "${var.server_pool_name}-VS"
  description                = "Terraform provisioned Virtual Server"
  access_log_enabled         = true
  enabled                    = true
  ip_address                 = var.public_ip
  ports                      = var.ports
  service_path               = var.lb_path
  pool_path                  = nsxt_policy_lb_pool.server_pool.path
  application_profile_path   = data.nsxt_policy_lb_app_profile.app_profile.path
}
