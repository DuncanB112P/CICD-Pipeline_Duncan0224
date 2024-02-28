# Repo purpose/function

This repo is used to create a CI/CD pipeline (using _AWS CodeBuild_ and _CodePipeline_) for hosting a static website on _AWS S3_, paired with _AWS Cloudfront_ for caching. Terraform is used to provision these resource, and the Terraform configuration uses an _S3_ bucket as a remote backend and a DynamoDB table for state-locking.

# Backend set-up

This configurations uses an _AWS S3_ bucket as a remote backend and an _AWS DynamoDB_ table for state-locking. Users will need to create these resources independently and pass the names of those resources into theTerraform configuration's **main.tf** file. Example:

    terraform {
      required_providers {
        aws = {
          source = "hashicorp/aws"
          version = "5.36.0"
        }
      }
      
      backend "s3" {
        encrypt = true
        bucket  = "<BUCKET-NAME>"
        key     = "backend/tfstate"
        #dynamodb_table = "<DYNAMODB-TABLE-NAME>"
        region = "us-east-1"
      }
    }


# Variable inputs that need to be changed based on user's environment

**variables_s3.tf**
* "website_bucket_names"
* "artifact_bucket_name" 

**pipeline_variables.tf**
* "github_repo"
* "pipeline_name"

**codebuild_variables.tf**
* "codebuild_project_name" 

**varaible_cf.tf** (_Cloudfront_)
* "oac_name"
* "cloudfront_location_restrictions" 

# External Files

In order to avoid committing potentially sensitive resource information to version control, **"${path.root}/PATH-TO-YOUR-FILE"** is used to pass Amazon Resource Numbers (ARN) in both the **codebuild_main.tf** and **pipeline_main.tf** configuration files. These files contain the ARNs for the _CodePipelineServiceRole_, _CodeBuildServiceRole_, and _codestar-connections:connection_ to GitHub.

These IAM roles and policies were already established in the client's AWS account. These roles and policies can alternatively be created in Terraform as part of the configuration.

Users who implement this configuration **MUST ENSURE THAT**: 
1. individual **.txt** files for each ARN exist in their local environment
2. that they have set the path to those files correctly (_relative to the "root" directory_).

**_It is important to note that alothough the "${path.root}/" method will keep sensitive information from being uploaded to version control, that information will still be present in the /tfstate file._**


