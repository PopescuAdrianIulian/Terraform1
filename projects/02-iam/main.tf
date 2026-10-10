data "aws_caller_identity" "current" {}

resource "aws_s3_bucket" "app_data" {
  bucket        = var.bucket_name
  force_destroy = true
}