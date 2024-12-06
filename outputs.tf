output "backend_bucket" {
  value = "afsoosmaamkhada123"
}

output "backend_key" {
  value = "terraform/state"
}

output "repository_url" {
  value = module.ecr.ecr_repository_url
}
output "ecr_repository_name" {
  value = module.ecr.ecr_repository_name
  description = "The name of the ECR repository"
}
output "ecr_repository_url" {
  value = module.ecr.repository_url
}
