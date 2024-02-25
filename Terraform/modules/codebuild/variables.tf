################# variables.tf for codebuild   ############################
# S3 bucket ID variable

variable "artifact_bucketID" {}

# Artifacts store type variable

variable "artifacts_store_type" {
  description = "Artifacts store type"
  type        = string
  default     = "CODEPIPELINE"
}