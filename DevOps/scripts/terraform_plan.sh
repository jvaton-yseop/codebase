#!/bin/bash
set -e

terraform --version
TF_KEY="terraform/${PROJECT_NAME}/${BRANCH_NAME}/terraform.tfstate"

echo TF_KEY $TF_KEY
echo TF_FILES_DIRECTORY $TF_FILES_DIRECTORY
echo TF_VAR_ENV $TF_VAR_ENV

terraform -chdir=${TF_FILES_DIRECTORY} plan -var-file=../AWS/${ACCOUNT_ID}/${TF_VAR_ENV}/values.tfvars --out=plan.binary
