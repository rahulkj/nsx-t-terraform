output "tkgi_floating_ip_pool_id" {
  value = module.tkgi_snat_ip_pool.id
}

output "tkgi_nodes_ip_block_id" {
  value = module.tkgi_nodes_ip_block.id
}

output "tkgi_pods_ip_block_id" {
  value = module.tkgi_pods_ip_block.id
}
