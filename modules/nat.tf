resource "nsxt_nat_rule" "INTERNAL-TO-EXTERNAL" {
  logical_router_id         = "${nsxt_logical_tier0_router.t0_router.id}"
  description               = "NR provisioned by Terraform"
  display_name              = "NR-test"
  action                    = "SNAT"
  enabled                   = true
  logging                   = true
  nat_pass                  = false
  translated_network        = "4.4.0.0/24"
  match_destination_network = "3.3.3.0/24"
  match_source_network      = "5.5.5.0/24"
}

resource "nsxt_nat_rule" "rule2" {
  logical_router_id         = "${nsxt_logical_tier0_router.t0_router.id}"
  description               = "NR provisioned by Terraform"
  display_name              = "NR1-test"
  action                    = "DNAT"
  enabled                   = true
  logging                   = true
  nat_pass                  = false
  translated_network        = "4.4.0.0/24"
  match_destination_network = "3.3.3.0/24"
  match_source_network      = "5.5.5.0/24"
}
