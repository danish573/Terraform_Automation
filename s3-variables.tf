resource "aws_s3_bucket" "my-s3-bucket" {
  bucket_prefix = var.bucket_prefix

  tags = var.tags
}
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.my-s3-bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}