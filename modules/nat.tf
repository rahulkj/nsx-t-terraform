# resource "nsxt_nat_rule" "INTERNAL-TO-EXTERNAL" {
#   logical_router_id         = "${nsxt_logical_tier0_router.t0_router.id}"
#   description               = "NR provisioned by Terraform"
#   display_name              = "NR-test"
#   action                    = "SNAT"
#   enabled                   = true
#   translated_network        = "10.0.1.91"
#   match_source_network      = "192.168.20.0/23"
# }
#
# resource "nsxt_nat_rule" "rule2" {
#   logical_router_id         = "${nsxt_logical_tier0_router.t0_router.id}"
#   description               = "NR provisioned by Terraform"
#   display_name              = "NR1-test"
#   action                    = "DNAT"
#   enabled                   = true
#   translated_network        = "10.0.1.92"
#   match_destination_network = "192.168.20.9"
# }
