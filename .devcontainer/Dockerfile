# Utiliser une image de base avec Python 3.9
FROM python:3.9-buster

# Installer wget pour récupérer Terraform et curl pour AWS CLI
RUN apt-get update && \
    apt-get install -y wget unzip curl && \
    apt-get clean

################################
# Terraform INSTALL
################################
# Définir la version de Terraform à installer
ENV TERRAFORM_VERSION=1.10.5
# for amd64
RUN if [ $(uname -m) = "x86_64" ]; then \
        wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
        mv terraform /usr/local/bin/ && \
        rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip ; \
    fi
# for arm64
RUN if [ $(uname -m) = "aarch64" ]; then \
        wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_arm64.zip && \
        unzip terraform_${TERRAFORM_VERSION}_linux_arm64.zip && \
        mv terraform /usr/local/bin/ && \
        rm terraform_${TERRAFORM_VERSION}_linux_arm64.zip ; \
    fi

################################
# AWS CLI INSTALL
################################
# for amd64
RUN if [ $(uname -m) = "x86_64" ]; then \
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
        unzip awscliv2.zip && \
        ./aws/install && \
        rm -rf awscliv2.zip ; \
    fi
# for arm64
RUN if [ $(uname -m) = "aarch64" ]; then \
        curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
        unzip awscliv2.zip && \
        ./aws/install && \
        rm -rf awscliv2.zip ; \
    fi

################################
# Terraform-docs INSTALL
################################
# Définir la version de terraform-docs à installer
ENV TERRAFORM_DOCS_VERSION=0.16.0
# for amd64
RUN if [ $(uname -m) = "x86_64" ]; then \
        wget https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
        tar -xzf terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz && \
        mv terraform-docs /usr/local/bin/ && \
        rm terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-amd64.tar.gz ; \
    fi
# for arm64
RUN if [ $(uname -m) = "aarch64" ]; then \
        wget https://github.com/terraform-docs/terraform-docs/releases/download/v${TERRAFORM_DOCS_VERSION}/terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-arm64.tar.gz && \
        tar -xzf terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-arm64.tar.gz && \
        mv terraform-docs /usr/local/bin/ && \
        rm terraform-docs-v${TERRAFORM_DOCS_VERSION}-linux-arm64.tar.gz ; \
    fi

# Créer un répertoire de travail
WORKDIR /workspace

# Installer des dépendances Python courantes (facultatif)
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir requests

# Ajouter un utilisateur non-root pour les travaux
RUN useradd -ms /bin/bash devuser
USER devuser

# Commande d'entrée
CMD [ "python3" ]

# Exposer le port pour les applications (facultatif)
EXPOSE 8000
