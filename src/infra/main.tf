terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.75.1"
    }
  }

  backend "s3" {
    bucket = "bucket-tf-state-fiap-team-32"
    key    = "eks/terraform.state"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = "stg"
      Owner       = "t32"
      Managed-by  = "Terraform"
    }
  }
}