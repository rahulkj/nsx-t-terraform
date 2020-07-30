resource "nsxt_ip_block" "ip_block" {
  display_name = var.ip_block_name
  cidr         = var.ip_block_cidr
}