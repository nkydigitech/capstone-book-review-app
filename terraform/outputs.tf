# Outputs shown after terraform apply

output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "eks_cluster_name" {
  description = "Name of the EKS cluster"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "API server endpoint for the EKS cluster"
  value       = module.eks.cluster_endpoint
}

output "rds_cluster_endpoint" {
  description = "Writer endpoint for the Aurora cluster"
  value       = module.rds.cluster_endpoint
  sensitive   = true
}

output "ecr_frontend_url" {
  description = "ECR repository URL for the frontend image"
  value       = aws_ecr_repository.frontend.repository_url
}

output "ecr_backend_url" {
  description = "ECR repository URL for the backend image"
  value       = aws_ecr_repository.backend.repository_url
}
