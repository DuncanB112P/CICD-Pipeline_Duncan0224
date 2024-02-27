**CICD-Pipeline_Duncan0224**

* This repo is used to create a CI/CD pipeline for an S3 hosting static website with AWS Cloudfront caching. Terraform is used to provision AWS resources: S3, Cloudfront, CodePipeline, and CodeBuild. The Terraform configuration is organized as modules. 


**Vaiable inputs that need to be changed based on the user's environment**

* variables_s3.tf -- bucket names for S3 buckets: (1) "website_bucket_names" (2) "artifact_bucket_name" 
* pipeline_variables.tf -- (1) "github_repo" , (2) "pipeline_name"
* codebuild_variables.tf -- (1) "codebuild_project_name" 
* varaible_cf.tf (Cloudfront) -- (1) "oac_name" , (2) "cloudfront_location_restrictions" 

**External files**

* In order to avoid committing potentially sensitive resource information to version control, **"${path.root}/PATH-TO-YOUR-FILE"** is used to pass Amazon Resource Numbers (ARN) in both the **codebuild_main.tf** and **pipeline_main.tf** configuration files. These files contain the ARNs for the **CodePipelineServiceRole**, **CodeBuildServiceRole**, and **codestar-connections:connection** to GitHub.
* These IAM roles and policies were already established in the client AWS account. These roles and policies can alternatively be created Terraform as part of the configuration. 

