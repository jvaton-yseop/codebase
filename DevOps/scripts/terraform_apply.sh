#!/usr/bin/env bash
set -e

terraform --version
TF_KEY="terraform/${PROJECT_NAME}/${BRANCH_NAME}/terraform.tfstate"

echo TF_FILES_DIRECTORY $TF_FILES_DIRECTORY

terraform "-chdir=${TF_FILES_DIRECTORY}" apply --auto-approve plan.binary
terraform "-chdir=${TF_FILES_DIRECTORY}" output -json > "${TF_FILES_DIRECTORY}/outputs.json"
