terraform {
  backend "s3" {
    bucket         = ""
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = ""
  }
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
}
}

