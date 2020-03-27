output "router_t0_id" {
  value = data.nsxt_logical_tier0_router.t0_router.id
}

output "floating_ip_pool_id" {
  value = nsxt_ip_pool.pks_snat_ip_pool.id
}

output "nodes_ip_block_id" {
  value = nsxt_ip_block.pks_nodes_ip_block.id
}

output "pods_ip_block_id" {
  value = nsxt_ip_block.pks_pods_ip_block.id
}

