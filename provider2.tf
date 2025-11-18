terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.21.0"
    }
  }
  backend "s3" {
    bucket = "oplinger-state-bucket"
    key = "prod-paul/oplinger/terraform.tfstate"
    encrypt = true
    region = "us-east-1"
    dynamodb_table = "oplinger-lock-table"
  }
    
  }


provider "aws" {
  # Configuration options
  region = var.my_aws_region
}

