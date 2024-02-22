provider "aws" {
  profile = "lead"
  region  = "us-east-1"
}
resource "aws_s3_bucket" "s3-bucket" {
  bucket        = "k8s-reddit-bucket-12"
  force_destroy = true
  tags = {
    Name = "k8s-reddit-bucket-12"
  }
}
resource "aws_dynamodb_table" "dynamo-table" {
  name           = "Lock-Files"
  hash_key       = "LockID"
  read_capacity  = "10"
  write_capacity = "10"
  attribute {
    name = "LockID"
    type = "S"
  }
}