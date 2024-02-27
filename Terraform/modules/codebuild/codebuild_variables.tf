variable "artifact_bucketID" {}

variable "CodeBuildServiceRole" {
    type = string
    default =  "arn:aws:iam::515808348954:role/CodeBuildServiceRole"
    sensitive = true
}