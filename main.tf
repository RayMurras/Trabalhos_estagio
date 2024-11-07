terraform {
  required_providers {
    aws = {
      source                = "hashicorp/aws"
      version               = "~> 5.42.0"
      configuration_aliases = [aws.useast]
    }

  }
  backend "s3" {
    bucket         = ""
    region         = "eu-central-1"
    key            = "docs-s3-cloudfront/terraform.tfstate"
    dynamodb_table = ""
    encrypt        = true
    assume_role = {
      role_arn = "arn:aws:iam::"
    }
  }
}

module "s3_bucket" {
  source = "./s3tfmodule/module"

  bucket_name = var.bucket_name

  bucket_policy = jsonencode({
    "Version" = "2008-10-17",
    "Id"      = "PolicyForCloudFrontPrivateContent",
    "Statement" = [
      {
        "Sid"    = "AllowCloudFrontServicePrincipal",
        "Effect" = "Allow",
        "Principal" = {
          "Service" = "cloudfront.amazonaws.com"
        },
        "Action"   = "s3:GetObject",
        "Resource" = "arn:aws:s3:::${var.bucket_name}/*",
        "Condition" = {
          "StringEquals" = {
            "AWS:SourceArn" = "${module.cloudfront.cloudfront_arn}"
          }
        }
      }
    ]
  })
}

module "cloudfront" {
  source = "./cftfmodule/module"

  origin_domain         = "${var.bucket_name}.s3.eu-central-1.amazonaws.com"
  origin_id             = var.bucket_name
  price_class           = var.cloudfront_price_class
  restriction_locations = var.cloudfront_restriction_locations
  acm_arn               = module.certificate.cert_arn
  aliases_domain        = var.domain

}

module "certificate" {
  source = "./certificate"
  providers = {
    aws = aws.useast
  }
  domain = var.domain
}

locals {
  mime_types = {
    "css"      = "text/css"
    "html"     = "text/html"
    "ico"      = "image/vnd.microsoft.icon"
    "js"       = "application/javascript"
    "json"     = "application/json"
    "map"      = "application/json"
    "png"      = "image/png"
    "svg"      = "image/svg+xml"
    "txt"      = "text/plain"
    "xml"      = "text/xml"
    "nojekyll" = "text/plain"
  }
}
