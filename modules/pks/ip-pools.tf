resource "nsxt_ip_pool" "pks_snat_ip_pool" {
  description = "ip_pool provisioned by Terraform"
  display_name = "${var.pks_snat_ip_pool_name}"

  subnet = {
    allocation_ranges = ["${var.pks_snat_ip_pool_range}"]
    cidr              = "${var.pks_snat_ip_pool_cidr}"
  }

  tag {
    tag = "ncp/cluster"
    scope = "${var.env_name}"
  }

  tag {
    tag = "ncp/external"
    scope = "true"
  }
}
