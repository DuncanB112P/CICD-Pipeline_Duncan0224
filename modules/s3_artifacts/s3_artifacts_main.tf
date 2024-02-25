######  Create s3 bucket to host static website    ######

resource "aws_s3_bucket" "artifact_bucket" {
  bucket        = var.artifact_bucket_name
  force_destroy = true

  tags = {
    Name = "ArtifactBucket"
  }
}