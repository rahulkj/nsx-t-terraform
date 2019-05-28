resource "nsxt_ip_pool" "pas_snat_ip_pool" {
  description = "ip_pool provisioned by Terraform"
  display_name = "${var.pas_snat_ip_pool_name}"

  tag = {
    tag = "ncp/cluster"
    scope = "${var.env_name}"
  }

  tag = {
    tag = "ncp/external"
    scope = "true"
  }

  subnet = {
    allocation_ranges = ["${var.pas_snat_ip_pool_range}"]
    cidr              = "${var.pas_snat_ip_pool_cidr}"
  }
}
