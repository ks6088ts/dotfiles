#!/bin/sh

mkdir -p outputs

# AWS CLI
# https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "outputs/awscliv2.zip"
cd outputs
unzip -o awscliv2.zip
sudo ./aws/install --update
cd -

# SORACOM CLI
VERSION=0.9.0
curl -L "https://github.com/soracom/soracom-cli/releases/download/v${VERSION}/soracom_${VERSION}_linux_arm64.tar.gz" -o "outputs/soracom_${VERSION}_linux_arm64.tar.gz"
cd outputs
tar xvf ./soracom_${VERSION}_linux_arm64.tar.gz
sudo cp soracom_${VERSION}_linux_arm64/soracom /usr/local/bin/.
cd -

rm -rf outputs
