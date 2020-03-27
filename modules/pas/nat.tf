resource "nsxt_nat_rule" "INTERNAL-TO-EXTERNAL" {
  logical_router_id    = nsxt_logical_tier0_router.t0_router.id
  description          = "INTERNAL-TO-EXTERNAL rule provisioned by Terraform"
  display_name         = "INTERNAL-TO-EXTERNAL"
  action               = "SNAT"
  enabled              = true
  translated_network   = var.snat_public_ip
  match_source_network = var.snat_cidr
}

resource "nsxt_nat_rule" "OpsManager" {
  logical_router_id         = nsxt_logical_tier0_router.t0_router.id
  description               = "OpsManager DNAT rule provisioned by Terraform"
  display_name              = "OpsManager"
  action                    = "DNAT"
  enabled                   = true
  translated_network        = var.ops_manager_private_ip
  match_destination_network = var.opsmanager_public_ip
}

