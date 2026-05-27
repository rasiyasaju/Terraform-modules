module "vpc" {
  source = "./modules/vpc"

  vpc_cidr       = var.vpc_cidr
  public_subnet1 = var.public_subnet_1
  public_subnet2 = var.public_subnet_2
}

module "security_group" {
  source = "./modules/security-group"

  vpc_id = module.vpc.vpc_id
}

module "iam" {
  source = "./modules/iam"
}

module "ec2" {
  source = "./modules/ec2"

  subnet_id         = module.vpc.public_subnet1_id
  security_group_id = module.security_group.sg_id
  instance_type     = var.instance_type
  key_name          = var.key_name
  iam_instance_profile = module.iam.instance_profile
}

module "ecr" {
  source = "./modules/ecr"
}

module "eks" {
  source = "./modules/eks"

  subnet_ids = [
    module.vpc.public_subnet1_id,
    module.vpc.public_subnet2_id
  ]

  cluster_role_arn = module.iam.eks_cluster_role_arn
  node_role_arn    = module.iam.eks_node_role_arn
}