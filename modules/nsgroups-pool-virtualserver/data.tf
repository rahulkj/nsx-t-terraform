data "nsxt_policy_lb_app_profile" "app_profile" {
  display_name = var.app_profile
}

data "nsxt_policy_lb_monitor" "active_lb_monitor" {
  display_name = var.active_lb_monitor_name
}

data "nsxt_policy_lb_monitor" "passive_lb_monitor" {
  display_name = var.passive_lb_monitor_name
}