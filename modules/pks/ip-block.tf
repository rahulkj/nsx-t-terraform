resource "nsxt_ip_block" "pks_nodes_ip_block" {
  description  = "pks-nodes-ip-block provisioned by Terraform"
  display_name = "${var.pks_nodes_ip_block_name}"
  cidr         = "${var.pks_nodes_ip_block_cidr}"
}

resource "nsxt_ip_block" "pks_pods_ip_block" {
  description  = "pks-pods-ip-block provisioned by Terraform"
  display_name = "${var.pks_pods_ip_block_name}"
  cidr         = "${var.pks_pods_ip_block_cidr}"
}
