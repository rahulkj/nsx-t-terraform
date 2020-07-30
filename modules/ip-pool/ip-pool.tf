

resource "nsxt_ip_pool" "ip_pool" {
  display_name = var.ip_pool_name

  subnet {
    allocation_ranges = ["${var.ip_pool_range_start}-${var.ip_pool_range_end}"]
    cidr              = var.ip_pool_cidr
  }
}
