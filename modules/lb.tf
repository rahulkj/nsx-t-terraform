resource "nsxt_lb_tcp_monitor" "lb_tcp_monitor" {
  description  = "om_tcp_monitor provisioned by Terraform"
  display_name = "om_tcp_monitor"
  fall_count   = 3
  interval     = 5
  monitor_port = 443
  rise_count   = 3
  timeout      = 10

  tag = {
    scope = "color"
    tag   = "red"
  }
}
