variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
  default     = "outcloud-wikitest"
}

variable "bucket_policy" {
  description = "S3 bucket policy JSON string"
  type        = string
  default     = ""
}
