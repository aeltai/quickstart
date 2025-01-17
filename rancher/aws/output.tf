output "rancher_server_url" {
  value = module.rancher_common.rancher_url
}

output "rancher_node_ip" {
  value = aws_instance.rancher_server.public_ip
}

output "quickstart_node_ip" {
  value = aws_instance.quickstart_node.public_ip
}

output "quickstart_node_2_ip" {
  value = aws_instance.quickstart_node_2.public_ip
}