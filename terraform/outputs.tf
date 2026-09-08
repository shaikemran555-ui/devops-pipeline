output "ecr_url" {
  value = aws_ecr_repository.app.repository_url
}
output "instance_id" {
  value = aws_instance.app.id
}

output "public_ip" {
  value = aws_instance.app.public_ip
}
