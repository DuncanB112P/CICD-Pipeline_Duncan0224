variable "oac_name" {
  type    = string
  default = "website_access_control"
}

variable "cloudfront_location_restrictions" {
  default = ["US", "CA"]
}


#####  FROM THE S3 MODULE  ######

variable "bucketID" {}

variable "bucket_domain" {}