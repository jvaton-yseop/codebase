module "s3_bucket" {
  # GitHub: https://github.com/terraform-aws-modules/terraform-aws-s3-bucket
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = local.bucket_name
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = false
  }
}
