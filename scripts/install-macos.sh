#!/bin/sh

ln -fns /usr/local/opt/python@3.8/bin/pip3.8 /usr/local/opt/python@3.8/bin/pip
ln -fns /usr/local/opt/python@3.8/bin/python3.8 /usr/local/opt/python@3.8/bin/python

# Install brew: https://brew.sh/
brew --version &> /dev/null
if [ $? -ne 0 ] ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install zinit: https://github.com/zdharma/zinit#option-1---automatic-installation-recommended
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

go get -u -v \
    github.com/x-motemen/ghq \
    golang.org/x/tools/... \
    google.golang.org/protobuf/cmd/protoc-gen-go \
    google.golang.org/grpc/cmd/protoc-gen-go-grpc

# textlint
# https://qiita.com/takasp/items/22f7f72b691fda30aea2
# https://qiita.com/munieru_jp/items/83c2c44fcadb177d2806
npm install -g \
    yarn \
    serverless \
    create-react-app \
    create-next-app \
    @aws-amplify/cli \
    textlint \
    textlint-rule-preset-ja-spacing \
    textlint-rule-preset-ja-technical-writing \
    textlint-rule-spellcheck-tech-word \
    textlint-rule-prh

mkdir -p outputs

curl "https://awscli.amazonaws.com/AWSCLIV2-2.0.30.pkg" -o "outputs/AWSCLIV2.pkg"
cd outputs
sudo installer -pkg AWSCLIV2.pkg -target /
cd -

# Completion
# gh: https://cli.github.com/manual/gh_completion
gh completion -s zsh | sudo tee /usr/local/share/zsh/site-functions/_gh
# soracom: https://github.com/soracom/soracom-cli/blob/master/README_ja.md
soracom completion zsh | sudo tee /usr/local/share/zsh/site-functions/_soracom
# kubectl: https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#completion
kubectl completion zsh | sudo tee /usr/local/share/zsh/site-functions/_kubectl
