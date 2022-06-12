resource "aws_s3_bucket" "logs_bucket" {
  bucket = var.LOGS_BUCKET_NAME
}

resource "aws_s3_bucket_policy" "logs_bucket_policy" {
  bucket = aws_s3_bucket.logs_bucket.id
  policy = file("${var.LOGS_BUCKET_NAME}-S3-policy.json")
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  bucket = aws_s3_bucket.logs_bucket.id
  acl    = "log-delivery-write"
}

