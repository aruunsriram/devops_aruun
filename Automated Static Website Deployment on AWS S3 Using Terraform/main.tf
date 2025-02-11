# Creation of S3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

# Ownership Controls
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Providing Public Access
resource "aws_s3_bucket_public_access_block" "access" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
#Defining Bucket policy
resource "aws_s3_bucket_policy" "public_policy" {
  bucket = aws_s3_bucket.mybucket.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.mybucket.arn}/*"
      }
    ]
  })
}

#Resource Creation
resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}
resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.mybucket.id
  key    = "error.html"
  source = "error.html"
  content_type = "text/html"
}
#Enabling Static website hosting
resource "aws_s3_bucket_website_configuration" "hosting" {
  bucket = aws_s3_bucket.mybucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

