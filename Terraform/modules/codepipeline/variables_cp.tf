
variable "project_name" {
  description = "CodeBuild project name"
  type        = string
  default     = "Pod2_HCN_Pipeline"
}






# ARTIFACTS VARIABLES (5)

variable "artifact_bucketID" {}

variable "artifacts_store_type" {
  description = "Artifacts store type"
  type        = string
  default     = "S3"
}

variable "output_artifacts" {
  description = "Output artifacts"
  type        = string
  default     = "tf-code"
}

variable "input_artifacts" {
  description = "Input artifacts"
  type        = string
  default     = "tf-code"
}

variable "output_artifact_format" {
  description = "Output artifact format"
  type        = string
  default     = "CODE_ZIP"
}





# S3 BUCKET - WEBSITE

variable "website_bucketID" {}






# REPOSITORY VARIABLES (4)

variable "repo_name" {
  description = "Repository name"
  type        = string
  default     = "Pod2_HCN_Repo"
}


variable "source_provider" {
  description = "Source provider"
  type        = string
  default     = "GitHub"
}


variable "full_repository_id" {
  description = "Full repository ID"
  type        = string
  default     = "DuncanB112P/CICD-Pipeline_Duncan0224"
}

# Branch name variable

variable "branch" {
  description = "Branch name"
  type        = string
  default     = "main"
}






# CodeStar connector credentials variable

variable "codestar_connector_credentials" {
  description = "CodeStar connector credentials"
  type        = string
  default     = "arn:aws:codestar-connections:us-east-1:515808348954:connection/4355d5be-6683-425a-9f31-a0ea1ead6fc3"
}


# Role name variable

variable "role_name" {
  description = "Role name"
  type        = string
  default     = "Pod2_Pipeline"
}

# Policy name variable

variable "policy_name" {
  description = "Policy name"
  type        = string
  default     = "HCN_Policy"
}

# SNS ARN for approval variable

variable "approve_sns_arn" {
  description = "SNS ARN for approval"
  type        = string
  default     = "sns"
}

# Approval comment variable

variable "approve_comment" {
  description = "Approval comment"
  type        = string
  default     = "Terraform code updated"
}

# Approval URL variable

variable "approve_url" {
  description = "Approval URL"
  type        = string
  default     = "url"
}



