resource "aws_acm_certificate" "docs_certificate" {
  domain_name       = var.domain
  validation_method = "DNS"

}