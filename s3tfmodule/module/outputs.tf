output "bucket_name" {
  description = "Name of the created S3 bucket"
  value       = aws_s3_bucket.s3_bucket.id
}

output "bucket_policy" {
  description = "The S3 bucket policy"
  value       = aws_s3_bucket_policy.s3-bucket-policy.policy
}

output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}

output "url_website" {
  value = aws_s3_bucket_website_configuration.docs_docusaurus.website_endpoint
}