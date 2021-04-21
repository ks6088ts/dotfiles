#!/bin/sh

mkdir -p outputs

# AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "outputs/awscliv2.zip"
cd outputs
unzip -o awscliv2.zip
sudo ./aws/install --update
cd -

# AWS SAM CLI
# https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-install-linux.html#serverless-sam-cli-install-linux-sam-cli
curl -L "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -o "outputs/aws-sam-cli-linux-x86_64.zip"
cd outputs
unzip aws-sam-cli-linux-x86_64.zip -d sam-installation
sudo ./sam-installation/install --update
sudo ./aws/install --update
cd -

# SORACOM CLI
curl -L "https://github.com/soracom/soracom-cli/releases/download/v0.5.2/soracom_0.5.2_linux_amd64.tar.gz" -o "outputs/soracom_0.5.2_linux_amd64.tar.gz"
cd outputs
tar xvf ./soracom_0.5.2_linux_amd64.tar.gz
sudo cp soracom_0.5.2_linux_amd64/soracom /usr/local/bin/.
cd -

# GitHub CLI
# https://github.com/cli/cli/blob/trunk/docs/install_linux.md#debian-ubuntu-linux-apt
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install -y gh

# kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o outputs/kubectl
curl -L "https://dl.k8s.io/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256" -o outputs/kubectl.sha256
cd outputs
echo "$(<kubectl.sha256) kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
cd -

rm -rf outputs
