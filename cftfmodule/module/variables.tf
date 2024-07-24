variable "origin_domain" {
  type        = string
  description = "The domain name of the origin (e.g., the S3 bucket)"
}

variable "origin_id" {
  type        = string
  description = "A unique identifier for the origin"
}

variable "comment" {
  type        = string
  description = "An optional comment about the CloudFront distribution"
  default     = ""
}

variable "price_class" {
  type        = string
  description = "The price class for the CloudFront distribution"
}

variable "default_root_object" {
  type        = string
  description = "The default object to serve when a request specifies a directory"
  default     = "index.html"
}

variable "restriction_type" {
  type        = string
  description = "The type of restriction for the CloudFront distribution"
  default     = "none"
}

variable "restriction_locations" {
  type        = list(string)
  description = "The locations to restrict access to (if restriction_type is 'whitelist' or 'blacklist')"
  default     = []
}

variable "allowed_methods" {
  type        = list(string)
  description = "The HTTP methods that are allowed for the default cache behavior."
  default     = ["GET", "HEAD", "OPTIONS"]
}

variable "cached_methods" {
  type        = list(string)
  description = "The HTTP methods for which CloudFront caches responses by default."
  default     = ["GET", "HEAD"]
}

variable "viewer_protocol_policy" {
  type        = string
  description = "The viewer protocol policy for the CDN distribution."
  default     = "https-only"
}

variable "origin_access_control_name" {
  type    = string
  default = "cf-access-control-name"
}

variable "origin_access_control_description" {
  type        = string
  description = "access control description of cloudfront"
  default     = "desc"
}

variable "origin_access_control_signing_behavior" {
  type        = string
  description = "access control of cloudfront signing behavior"
  default     = "always"
}

variable "acm_arn" {
  type        = string
  description = "Acm certificate"
}

variable "aliases_domain" {
  description = "Alternatives domain names"
}

variable "cloudfront_policy" {
  description = "Name of Cloudfront policy"
  default     = "cf-policy"
}
