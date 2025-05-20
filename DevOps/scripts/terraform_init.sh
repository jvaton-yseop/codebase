#!/usr/bin/env bash
set -e

terraform --version
TF_KEY="terraform/${PROJECT_NAME}/${BRANCH_NAME}/terraform.tfstate"

echo TF_KEY $TF_KEY
echo TF_FILES_DIRECTORY $TF_FILES_DIRECTORY
echo BUCKET_TF_STATE $BUCKET_TF_STATE
echo DYNAMO_DB_TF $DYNAMO_DB_TF
echo AWS_REGION $AWS_REGION

if [ -f "${TF_FILES_DIRECTORY}/.terraform.lock.hcl" ]; then
    echo "Remove ${TF_FILES_DIRECTORY}/.terraform.lock.hcl"
    rm "${TF_FILES_DIRECTORY}/.terraform.lock.hcl"
fi

if [ -d "${TF_FILES_DIRECTORY}/.terraform" ]; then
    echo "Remove ${TF_FILES_DIRECTORY}/.terraform"
    rm -rf "${TF_FILES_DIRECTORY}/.terraform"
fi

if [ -f "${TF_FILES_DIRECTORY}/plan.binary" ]; then
    echo "Remove ${TF_FILES_DIRECTORY}/plan.binary"
    rm -rf "${TF_FILES_DIRECTORY}/plan.binary"
fi

terraform -chdir=${TF_FILES_DIRECTORY} init -backend-config="key=${TF_KEY}" -backend-config="bucket=${BUCKET_TF_STATE}" -backend-config="dynamodb_table=${DYNAMO_DB_TF}" -backend-config="region=${AWS_REGION}"
