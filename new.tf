data "aws_ecr_repository" "service" {
  name = "ecr-repository" #just pass the name of the ecr repo
}


resource "aws_ecs_service" "name" {
  ecr_repo_url = data.aws_ecr_repository.repository_url # you can get the repo url if that exists already
}
