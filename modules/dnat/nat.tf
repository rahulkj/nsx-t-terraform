resource "nsxt_policy_nat_rule" "dnat_rule" {
  display_name         = var.rule_name
  action               = "DNAT"
  destination_networks = var.public_ip
  translated_networks  = var.private_ip
  gateway_path         = var.t0_gateway_path
}