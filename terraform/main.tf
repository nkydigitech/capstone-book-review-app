# Root Module - calls all child modules

# VPC
module "vpc" {
  source = "./modules/vpc"

  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

# EKS
module "eks" {
  source = "./modules/eks"

  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  cluster_version       = var.eks_cluster_version
  node_instance_type    = var.eks_node_instance_type
  node_min_size         = var.eks_node_min_size
  node_max_size         = var.eks_node_max_size
  node_desired_size     = var.eks_node_desired_size
}

# RDS Aurora
module "rds" {
  source = "./modules/rds"

  project_name        = var.project_name
  environment         = var.environment
  vpc_id              = module.vpc.vpc_id
  private_subnet_ids  = module.vpc.private_subnet_ids
  eks_security_group  = module.eks.node_security_group_id
  db_name             = var.db_name
  db_username         = var.db_username
  instance_class      = var.db_instance_class
}

# ECR Repositories
resource "aws_ecr_repository" "frontend" {
  name                 = "${var.project_name}-frontend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_repository" "backend" {
  name                 = "${var.project_name}-backend"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
