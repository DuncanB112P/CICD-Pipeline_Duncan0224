#####  PRIVIDER AND BACKEND #####

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.38.0"
    }
  }
  backend "s3" {
    bucket  = "cicd-s3-remotebackend-2024"
    encrypt = true
    key     = "backend/tfstate"
    region  = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}


#####  MODULES  #####

module "s3_buckets" {
    source = "./modules/s3"
}

module "cloudfront" {
    source = "./modules/cloudfront"
    bucketID      = module.s3_buckets.bucketID
    bucket_domain = module.s3_buckets.bucket_domain
}