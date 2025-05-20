#!/usr/bin/env bash
set -e

terraform --version
TF_KEY="terraform/${PROJECT_NAME}/${BRANCH_NAME}/terraform.tfstate"

echo TF_FILES_DIRECTORY $TF_FILES_DIRECTORY

terraform "-chdir=${TF_FILES_DIRECTORY}" "destroy -var-file=../AWS/${ACCOUNT_ID}/${TF_VAR_ENV}/values.tfvars" --auto-approve
