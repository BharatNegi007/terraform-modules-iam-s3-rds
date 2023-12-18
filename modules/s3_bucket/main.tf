#----------------------------------------------------------
# Create a S3 bucket with following configurations
# Server-side encryption must be enabled.
# Bucket policies only allow HTTPS requests.
# Bucket must block public access.
# Bucket versioning must be enabled.
#------------------------------------------------------------

locals {
  create_bucket = var.create_bucket
  encryption    = var.apply_server_side_encryption_by_default
  region        = "ap-southeast-1"
  bucket_acl    = "private"
}


resource "aws_s3_bucket" "newbucket" {
  count = local.create_bucket ? 1 : 0

  bucket        = var.bucket_name
  bucket_prefix = var.bucket_prefix
  force_destroy = var.force_destroy
  tags          = var.bucket_tags
  acl           = local.bucket_acl
}


resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  count = local.create_bucket && var.apply_server_side_encryption_by_default ? 1 : 0

  bucket = aws_s3_bucket.newbucket[0].id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_versioning" "bucket_versioning" {
  count = local.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.newbucket[0].id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket_Access" {
  count = local.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.newbucket[0].id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_policy" "s3_policy" {
  count = local.create_bucket ? 1 : 0

  bucket = aws_s3_bucket.newbucket[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": [
        "arn:aws:s3:::${var.bucket_name}/*",
        "arn:aws:s3:::${var.bucket_name}"
      ],
      "Condition": {
        "Bool": {
          "aws:SecureTransport": "false"
        }
      }
    }
  ]
}
EOF
}
