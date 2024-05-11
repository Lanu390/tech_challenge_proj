output "vpc_id" {
  description = "vpc id attached to the eks cluster ."
  value       = module.vpc.vpc_id
}
output "region" {
  description = "AWS region"
  value       = var.aws_region
}

