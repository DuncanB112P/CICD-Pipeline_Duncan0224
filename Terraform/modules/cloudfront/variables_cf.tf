variable "oac_name" {
  type    = string
  default = "sduncan_test_website_access_control_0224"
}

variable "cloudfront_location_restrictions" {
  default = ["US", "CA"]
}

variable "website_bucketID" {}

variable "bucket_domain" {}
