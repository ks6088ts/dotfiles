#!/bin/sh

# Install zinit: https://github.com/zdharma/zinit#option-1---automatic-installation-recommended
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# Completion
# gh: https://cli.github.com/manual/gh_completion
gh completion -s zsh | sudo tee /usr/local/share/zsh/site-functions/_gh
# soracom: https://github.com/soracom/soracom-cli/blob/master/README_ja.md
soracom completion zsh | sudo tee /usr/local/share/zsh/site-functions/_soracom
# kubectl: https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands#completion
kubectl completion zsh | sudo tee /usr/local/share/zsh/site-functions/_kubectl
# yq: https://mikefarah.gitbook.io/yq/v/v4.x/commands/shell-completion#zsh
yq shell-completion zsh | sudo tee /usr/local/share/zsh/site-functions/_yq
