#!/bin/sh

# https://dbrgn.github.io/tealdeer/installing.html#through-cargo-install
cargo install tealdeer

tldr --update

# https://dbrgn.github.io/tealdeer/installing.html#autocompletion
curl https://raw.githubusercontent.com/dbrgn/tealdeer/master/zsh_tealdeer --output /usr/local/share/zsh/site-functions/_tldr
