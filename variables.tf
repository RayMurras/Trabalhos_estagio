
variable "bucket_name" {
  description = "Name of the bucket S3"
}

variable "cloudfront_price_class" {
  description = "cloudfront price class"
}
variable "cloudfront_restriction_locations" {
  description = "cloudfront restriction locations"
  type        = list(string)
  default     = []
}
variable "domain" {
  description = "Domain name"
}
