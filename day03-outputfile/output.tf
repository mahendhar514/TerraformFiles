output "private-ip" {
  value = aws_instance.localname.private_ip
  sensitive = true
}

output "public-ip" {
  value = aws_instance.localname.public_ip
  sensitive = true
}

output "instance-id" {
    value = aws_instance.localname.id
}

output "instance-state" {
    value = aws_instance.localname.instance_state
}