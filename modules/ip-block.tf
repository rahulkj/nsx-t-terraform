resource "nsxt_ip_block" "pcf_ip_block" {
  description  = "pcf-ip-block provisioned by Terraform"
  display_name = "${var.pcf_ip_block_name}"
  cidr         = "${var.pcf_ip_block_cidr}"

  tag = {
    tag = "ncp/cluster"
    scope = "${var.env_name}"
  }
}
