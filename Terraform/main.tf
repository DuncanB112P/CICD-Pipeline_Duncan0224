terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }

  backend "s3" {

    encrypt        = true
    bucket         = "cicd-s3-remotebackend-2024"
    key            = "backend/tfstate"
    #dynamodb_table = "tfstate-lock-dynamo"
    region         = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"

}




##############      MODULES     ################

module "build" {
  source = "./modules/codebuild"
  artifact_bucketID = module.buckets_s3.artifact_bucketID
}


module "pipeline" {
  source = "./modules/codepipeline"
  artifact_bucketID = module.buckets_s3.artifact_bucketID
  website_bucketID = module.buckets_s3.website_bucketID
}


module "buckets_s3" {
  source = "./modules/s3"
}

module "cloudfront_dist" {
  source        = "./modules/cloudfront"
  website_bucketID      = module.buckets_s3.website_bucketID
  bucket_domain = module.buckets_s3.bucket_domain
}

module "codebuild" {
  source = "./modules/codebuild"
  artifact_bucketID = module.buckets_s3.artifact_bucketID
}


#############      OUTPUTS      ################

output "website_domain_name" {
  value = "http://${module.cloudfront_dist.cf_domain_name}"
}