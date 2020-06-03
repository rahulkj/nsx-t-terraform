variable "t0_gateway_path" {}
variable "rule_name" {}
variable "public_ip" {
  type = list(string)
}
variable "private_ip" {
  type = list(string)
}