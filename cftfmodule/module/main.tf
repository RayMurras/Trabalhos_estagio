resource "aws_cloudfront_distribution" "cf_docs" {
  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.comment
  price_class         = var.price_class
  default_root_object = var.default_root_object
  aliases             = [var.aliases_domain]

  origin {
    domain_name              = var.origin_domain
    origin_id                = var.origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.this.id
  }

  default_cache_behavior {
    allowed_methods        = var.allowed_methods
    cached_methods         = var.cached_methods
    target_origin_id       = var.origin_id
    cache_policy_id        = aws_cloudfront_cache_policy.cloudfront_policy.id
    viewer_protocol_policy = var.viewer_protocol_policy
  }

  viewer_certificate {
    acm_certificate_arn      = var.acm_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = var.restriction_type
      locations        = var.restriction_locations
    }
  }
}

resource "aws_cloudfront_cache_policy" "cloudfront_policy" {
  name        = var.cloudfront_policy
  min_ttl     = 1
  default_ttl = 86400
  max_ttl     = 31536000

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_control" "this" {
  name                              = var.origin_access_control_name
  description                       = var.origin_access_control_description
  origin_access_control_origin_type = "s3"
  signing_behavior                  = var.origin_access_control_signing_behavior
  signing_protocol                  = "sigv4"

}

  