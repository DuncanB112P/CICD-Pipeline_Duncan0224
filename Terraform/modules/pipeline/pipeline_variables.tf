variable "artifact_bucketID" {}

variable "codebuild_project_name" {}

variable "website_bucketID" {}

variable "CodePipelineServiceRole" {
    default = "arn:aws:iam::515808348954:role/CodePipelineServiceRole"
}

variable "codestar_connection_credentials" {
    default = "arn:aws:codestar-connections:us-east-1:515808348954:connection/c8b50689-b855-476a-b82c-53bc4964570a"
}

variable "github_repo" {
    default = "DuncanB112P/CICD-Pipeline_Duncan0224"
}

variable "pipeline_name" {
    default = "test-pipeline-sduncan0224"
}


