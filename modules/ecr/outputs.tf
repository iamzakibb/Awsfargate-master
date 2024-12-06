output "repository_url" {
  value = aws_ecr_repository.main.repository_url
}
output "ecr_repository_name" {
  value = aws_ecr_repository.main.name
  description = "The name of the ECR repository"
}
output "ecr_repository_url" {
  value = aws_ecr_repository.main.repository_url
}
