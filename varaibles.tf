variable "bucket_name" {
  description = "The name of the S3 bucket to store Terraform state."
  type        = string
  default = "afsoosmaamkhada123"
}

variable "lock_table_name" {
  description = "The name of the DynamoDB table for state locking."
  default = "locktfstate"
  type        = string
}

variable "environment" {
  description = "Environment tag for resources (e.g., dev, prod)."
  type        = string
  default = "Dev"
}

variable "aws_region" {
  default = "us-east-1"
}