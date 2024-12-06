terraform {
  backend "s3" {
    bucket         = "afsoosmaamkhada123"
    key            = "terraform/state"
    region         = "us-east-1"
    dynamodb_table = "locktfstate"
  }
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }
}
}

