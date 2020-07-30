resource "nsxt_policy_lb_service" "lb" {
  display_name      = var.lb_name
  description       = "Terraform provisioned Service"
  connectivity_path = var.t1_gateway_path
  size              = var.lb_type
  enabled           = true
  error_log_level   = "ERROR"
}