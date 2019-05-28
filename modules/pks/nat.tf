resource "nsxt_nat_rule" "PKS" {
  logical_router_id         = "${data.nsxt_logical_tier0_router.t0_router.id}"
  description               = "PKS DNAT rule provisioned by Terraform"
  display_name              = "PKS"
  action                    = "DNAT"
  enabled                   = true
  translated_network        = "${var.pks_api_private_ip}"
  match_destination_network = "${var.pks_public_ip}"
}
