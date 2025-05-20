#!/bin/bash
echo "Running terraform-docs asciidoc table --output-file README.adoc --output-mode inject ./"
cd ./DevOps/terraform
terraform-docs asciidoc table --output-file README.adoc --output-mode inject ./
