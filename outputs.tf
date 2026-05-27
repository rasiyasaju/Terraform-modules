output "jenkins_public_ip" {
  value = module.ec2.jenkins_public_ip
}

output "ansible_public_ip" {
  value = module.ec2.ansible_public_ip
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}