#!/bin/bash
set -e

terraform --version
TF_KEY="terraform/${PROJECT_NAME}/${BRANCH_NAME}/terraform.tfstate"

echo TF_FILES_DIRECTORY $TF_FILES_DIRECTORY

terraform -chdir=$TF_FILES_DIRECTORY show -json plan.binary | jq '.' > plan.json
checkov -f plan.json --config-file DevOps/.checkov.yaml

