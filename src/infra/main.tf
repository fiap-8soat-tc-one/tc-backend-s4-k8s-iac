# Specify the AWS provider
provider "aws" {
  region = "us-east-1" # Replace with your preferred AWS region
}

# Generate a random string for unique bucket name (optional)
resource "random_id" "bucket_id" {
  byte_length = 4
}

# Create an S3 bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "fiap-${random_id.bucket_id.hex}"  # Replace with a unique name
}

# Output the bucket name
output "bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}

# Random ID provider to generate the unique identifier
provider "random" {}
