resource "nsxt_policy_nat_rule" "snat_rule" {
  display_name        = var.rule_name
  action              = "SNAT"
  source_networks     = var.cidr
  translated_networks = var.public_ip
  gateway_path        = var.t0_gateway_path
}