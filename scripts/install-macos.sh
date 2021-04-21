#!/bin/sh

ln -fns /usr/local/opt/python@3.8/bin/pip3.8 /usr/local/opt/python@3.8/bin/pip
ln -fns /usr/local/opt/python@3.8/bin/python3.8 /usr/local/opt/python@3.8/bin/python

# Install brew: https://brew.sh/
brew --version &> /dev/null
if [ $? -ne 0 ] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

mkdir -p outputs

curl "https://awscli.amazonaws.com/AWSCLIV2-2.0.30.pkg" -o "outputs/AWSCLIV2.pkg"
cd outputs
sudo installer -pkg AWSCLIV2.pkg -target /
cd -

rm -rf outputs
