
resource "aws_codebuild_project" "test_build" {
  name          = "test-project-sduncan0224"
  description   = "test_codebuild_project"
  build_timeout = 5
  service_role  = "arn:aws:iam::515808348954:role/CodeBuildServiceRole"

  artifacts {
    type = "S3"
    location = var.artifact_bucketID
  }



  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
    environment_variable {
      name  = "TERRAFORM_VERSION"
      value = "1.7.3"
    }
  }

  source {
    type            = "CODEPIPELINE"
    buildspec = "./files/buildspec.yml"
  }

  source_version = "main"
}