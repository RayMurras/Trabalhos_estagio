output "cert_domain" {
  value = aws_acm_certificate.docs_certificate.domain_name
}
output "cert_arn" {
  value = aws_acm_certificate.docs_certificate.arn
}

output "domain_validation" {
  value = { for dvo in aws_acm_certificate.docs_certificate.domain_validation_options : dvo.domain_name => {
    resource_record_name  = dvo.resource_record_name
    resource_record_type  = dvo.resource_record_type
    resource_record_value = dvo.resource_record_value
    }
  }
}
