#!/bin/bash
set -e

terraform --version

echo TF_FILES_DIRECTORY $TF_FILES_DIRECTORY

terraform -chdir=${TF_FILES_DIRECTORY} validate