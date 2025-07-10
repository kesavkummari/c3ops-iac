output "instance_public_ip" {
  value = aws_instance.web.public_ip
}
output "instance_private_dns" {
  value = aws_instance.web.private_dns
}
output "instance_id" {
  value = aws_instance.web.id
}
output "instance_name" {
  value = aws_instance.web.tags["Name"]
}
output "instance_public_dns" {
  value = aws_instance.web.public_dns
}
output "instance_private_ip" {
  value = aws_instance.web.private_ip
}
output "instance_state" {
  value = aws_instance.web.instance_state
}