# Specify the AWS provider
provider "aws" {
  region = "us-east-1"  # Substitua pela região preferida, se necessário
}

# Configure o backend para armazenar o estado no bucket S3 especificado
terraform {
  backend "s3" {
    bucket = "fiap-2bdc9c48"  # Nome do bucket onde o estado será armazenado
    key    = "terraform/states/team32.tfstate"  # Caminho do arquivo de estado dentro do bucket
    region = "us-east-1"  # Região do bucket
  }
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "fiap-8soat-team32-s3"  # Substitua com o nome desejado do bucket
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
