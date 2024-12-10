terraform {
  backend "s3" {
    bucket         = "cicd-adt-tf-state-dca752-fdas-infobank-proving-ground-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "cicd-adt-tf-state-dca752-dynamo"
  }
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
}
}

