locals {
  account_root_id = "410500417314"
  global_tags = {
    # Name of the resource Has to match naming convention
    Project = var.PROJECT_NAME
    # Environment name
    Env = var.ENV
    # Who is in charge OF
    Team = "Innovation"
    # IAC
    IAC = "terraform"
    # Branch name
    BranchName = var.BRANCH_NAME
    # Repos URL
    ProjectUrl = var.PROJECT_URL
    # Code owner
    CodeOwner = "jvaton"
  }
  bucket_name = "codebase-${random_integer.bucket_suffix.result}"
}

resource "random_integer" "bucket_suffix" {
  min = 1000
  max = 9999
}
