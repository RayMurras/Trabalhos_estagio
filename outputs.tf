output "domain_validation" {
  value = module.certificate.domain_validation
}
output "cert_arn" {
  value = module.certificate.cert_arn
}

output "url_website" {
  value = module.s3_bucket.url_website
}
