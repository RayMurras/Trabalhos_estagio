resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_policy" "s3-bucket-policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = var.bucket_policy
}

resource "aws_s3_bucket_website_configuration" "docs_docusaurus" {
  bucket = aws_s3_bucket.s3_bucket.id
  index_document {
    suffix = "index.html"
  }
}

locals {
  site_build_directory = "/home/rayanne/documentation-platform/build"
}

resource "aws_s3_object" "build_docusaurus" {
  bucket = aws_s3_bucket.s3_bucket.id
  key    = "build_site"
  source = "/home/rayanne/documentation-platform/build"
  etag   = filemd5("/home/rayanne/documentation-platform/build/index.html")
}



