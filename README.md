**REPO FUNCTION/PURPOSE**

This repo is used to create a CI/CD pipeline for an S3 hosting static website with AWS Cloudfront caching. Terraform is used to provision AWS resources: S3, Cloudfront, CodePipeline, and CodeBuild. The Terraform configuration is organized as modules.

**SET-UP**

This configurations uses an _AWS S3_ bucket as a remote backend and an _AWS DynamoDB_ table for state-locking. Users will need to create these resources independently and pass the names of those resources into the **main.tf** file. 

**VARIABLE INPUTS THAT NEED TO BE CHANGED BASED ON USER'S ENVIRONMENT**

* variables_s3.tf -- (1) "website_bucket_names" (2) "artifact_bucket_name" 
* pipeline_variables.tf -- (1) "github_repo" , (2) "pipeline_name"
* codebuild_variables.tf -- (1) "codebuild_project_name" 
* varaible_cf.tf (Cloudfront) -- (1) "oac_name" , (2) "cloudfront_location_restrictions" 

**EXTERNAL FILES**

In order to avoid committing potentially sensitive resource information to version control, **"${path.root}/PATH-TO-YOUR-FILE"** is used to pass Amazon Resource Numbers (ARN) in both the **codebuild_main.tf** and **pipeline_main.tf** configuration files. These files contain the ARNs for the _CodePipelineServiceRole_, _CodeBuildServiceRole_, and _codestar-connections:connection_ to GitHub.

These IAM roles and policies were already established in the client's AWS account. These roles and policies can alternatively be created in Terraform as part of the configuration.

Users who implement this configuration **MUST ENSURE THAT**: **(1)** individual **.txt** files for each ARN exist in their local environment, and **(2)** that they have set the path to those files correctly (_relative to the "root" directory_). 


