provider "aws" {
  region = var.AWS_REGION
  default_tags {
    tags = local.global_tags
  }
}

