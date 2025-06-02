terraform {
  backend "s3" {
    bucket = "mydev-terraform-project-bucket-s3"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamodb-table"
  }
}