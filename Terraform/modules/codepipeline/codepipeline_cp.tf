##############      CODEPIPELINE RESOURCE BLOCK     ################
resource "aws_codestarconnections_connection" "sduncan-test-connection-0224" {
  name          = "test-connection"
  provider_type = "GitHub"
}


resource "aws_codepipeline" "Pod2_HCN_Pipeline" {

  name     = var.project_name
  role_arn = "arn:aws:iam::515808348954:role/CodePipelineServiceRole"


  artifact_store {
    type     = var.artifacts_store_type
    location = var.artifact_bucketID
  }


##############      CODEPIPELINE STAGES BLOCK       ################

  stage {
    name = "Source"
    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = [var.output_artifacts]
      configuration = {
        FullRepositoryId     = var.full_repository_id
        BranchName           = var.branch
        ConnectionArn        = var.codestar_connector_credentials
        OutputArtifactFormat = var.output_artifact_format
      }
    }
  }

  stage {
    name = "Apply" #"Plan"
    action {
      name            = "Build"
      category        = "Build"
      provider        = "CodeBuild"
      version         = "1"
      owner           = "AWS"
      input_artifacts = [var.input_artifacts]
      configuration = {
        ProjectName = var.project_name
      }
    }
  }

  stage {
    name = "Approve"
    action {
      name            = "Approval"
      category        = "Approval"
      owner           = "AWS"
      provider        = "Manual"
      version         = "1"
      input_artifacts = []
      configuration = {
        
      }
    }
  }

  stage {
    name = "Deploy"
    action {
      name            = "Deploy"
      category        = "Deploy"
      provider        = "S3"
      version         = "1"
      owner           = "AWS"
      input_artifacts = [var.output_artifacts]
      configuration = {
        BucketName = var.website_bucketID
        Extract    = "true"
        ObjectKey  = "/"
      }
    }
  }
}

