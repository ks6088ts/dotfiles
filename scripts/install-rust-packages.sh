#!/bin/sh

set -eu

rustup component add \
    rls \
    rust-analysis \
    rust-src

cargo install \
    bottom \
    cargo-edit \
    tealdeer

# tldr
# https://dbrgn.github.io/tealdeer/installing.html#through-cargo-install
# https://dbrgn.github.io/tealdeer/installing.html#autocompletion
tldr --update
curl https://raw.githubusercontent.com/dbrgn/tealdeer/master/zsh_tealdeer --output /usr/local/share/zsh/site-functions/_tldr
