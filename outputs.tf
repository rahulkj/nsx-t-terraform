output "router_t0_id" {
  value = module.pks.router_t0_id
}

output "pks_floating_ip_pool_id" {
  value = module.pks.floating_ip_pool_id
}

output "pks_nodes_ip_block_id" {
  value = module.pks.nodes_ip_block_id
}

output "pks_pods_ip_block_id" {
  value = module.pks.pods_ip_block_id
}

output "foundation_name" {
  value = var.env_name
}

output "overlay_transport_zone_name" {
  value = var.transport_zone_overlay_name
}

output "router_t0_name" {
  value = var.router_t0
}

output "pas_ip_block_name" {
  value = var.pcf_ip_block_name
}

output "pas_ip_block_cidr" {
  value = var.pcf_ip_block_cidr
}

output "pas_floating_ip_pool_name" {
  value = var.pas_snat_ip_pool_name
}

