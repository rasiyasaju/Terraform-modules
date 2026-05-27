output "jenkins_public_ip" {
  value = aws_instance.jenkins.public_ip
}

output "ansible_public_ip" {
  value = aws_instance.ansible.public_ip
}