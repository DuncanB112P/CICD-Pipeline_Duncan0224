
resource "aws_codepipeline" "codepipeline" {
  name     = "test-pipeline-sduncan0224"
  role_arn = "arn:aws:iam::515808348954:role/CodePipelineServiceRole"

  artifact_store {
    location = var.artifact_bucketID
    type     = "S3"
  }

  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        ConnectionArn    = "arn:aws:codestar-connections:us-east-1:515808348954:connection/c8b50689-b855-476a-b82c-53bc4964570a"
        FullRepositoryId = "DuncanB112P/CICD-Pipeline_Duncan0224"
        BranchName       = "main"
      }
    }
  }

  stage {
    name = "Build"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      input_artifacts  = "tf-code"
      output_artifacts = "build_output"
      version          = "1"

      configuration = {
        ProjectName = var.codebuild_project_name
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "S3"
      input_artifacts = ["build-output"]
      version         = "1"

      configuration = {
        BucketName = var.website_bucketID
        Extract    = "true"
      }
    }
  }
}



