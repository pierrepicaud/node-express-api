output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.node_express_api[0]
}

output "api_ip" {
  value = aws_instance.node_express_api[0]
}
