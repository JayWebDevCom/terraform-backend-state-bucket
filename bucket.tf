resource "aws_s3_bucket" "terraform_backend" {
  bucket = var.BUCKET_NAME
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bucket_encryption" {
  bucket = aws_s3_bucket.terraform_backend.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}
resource "aws_s3_bucket_policy" "terraform_backend_policy" {
  bucket = aws_s3_bucket.terraform_backend.id
  policy = file("${var.BUCKET_NAME}-S3-policy.json")
}

resource "aws_s3_bucket_public_access_block" "block" {
  bucket = aws_s3_bucket.terraform_backend.id
  
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

