output "instance_public_ip" {
  description = "Public IP of EC2 Instance"
  value       = aws_instance.devops_server.public_ip
}

output "instance_id" {
  description = "EC2 Instance ID"
  value       = aws_instance.devops_server.id
}

output "jenkins_url" {
  value = "http://${aws_instance.devops_server.public_ip}:8080"
}

output "application_url" {
  value = "http://${aws_instance.devops_server.public_ip}:3000"
}