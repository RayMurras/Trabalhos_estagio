output "cloudfront_domain" {
  description = "The domain name of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cf_docs.domain_name
}

output "cloudfront_arn" {
  description = "The arn of the CloudFront distribution"
  value       = aws_cloudfront_distribution.cf_docs.arn
}


