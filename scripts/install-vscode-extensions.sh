#!/bin/bash

# ```bash
# curl -s https://raw.githubusercontent.com/ks6088ts/dotfiles/master/scripts/install-vscode-extensions.sh | /bin/bash
# ```
# * [VS CodeをGitHubとスクリプト使って半自動で楽々セットアップ](https://karaage.hatenadiary.jp/entry/2019/02/27/073000)
# * [karaage0703/vscode-dotfiles](https://github.com/karaage0703/vscode-dotfiles)
# * [プログラマーのためのVisual Studio Codeの教科書](https://book.mynavi.jp/ec/products/detail/id=115232)
# * [VSCodeの拡張機能、なに使ってますか？ はてなエンジニア世論調査 #2](https://developer.hatenastaff.com/entry/2020/08/14/093000)

extensions=(
  # Misc
  editorconfig.editorconfig
  streetsidesoftware.code-spell-checker
  # Document
  yzane.markdown-pdf
  redhat.vscode-yaml
  hediet.vscode-drawio
  jebbs.plantuml
  taichi.vscode-textlint
  # Infrastructure
  ms-azuretools.vscode-docker
  ms-kubernetes-tools.vscode-kubernetes-tools
  amazonwebservices.aws-toolkit-vscode
  # Visual
  oderwat.indent-rainbow
  ibm.output-colorizer
  mechatroner.rainbow-csv
  vscode-icons-team.vscode-icons
  # Remote
  ms-vscode-remote.remote-wsl
  ms-vscode-remote.remote-containers
  ms-vscode-remote.remote-ssh
  ms-vsliveshare.vsliveshare
  # Git
  eamodio.gitlens
  # Go
  golang.go
  # Rust
  rust-lang.rust
  # Python
  ms-python.python
  ms-python.vscode-pylance
  # JavaScript
  eg2.vscode-npm-script
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  apollographql.vscode-apollo
)

for i in ${extensions[@]}; do
  code --install-extension $i
done
