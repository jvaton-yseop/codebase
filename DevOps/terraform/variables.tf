#------------------------------------------------------------------------------
# GLOBAL
#------------------------------------------------------------------------------
# FROM VALUES.TFVARS
variable "AWS_REGION" {
  type        = string
  description = "AWS Region target by default"
}

variable "ENV" {
  type        = string
  description = "Environnement"
}

variable "ACCOUNT_ID" {
  type        = string
  description = "AWS Account ID"
}

variable "BRANCH_NAME" {
  type        = string
  description = "Github branch where resources come from"
}

variable "PROJECT_NAME" {
  type        = string
  description = "Name of project"
}

# DEFAULT 
variable "PROJECT_URL" {
  type        = string
  default     = "https://github.com/jvaton-yseop/codebase"
  description = "Github repos URL"
}
#------------------------------------------------------------------------------
