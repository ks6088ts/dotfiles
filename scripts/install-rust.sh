#!/bin/sh

set -eu

# https://www.rust-lang.org/tools/install
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# source $HOME/.cargo/env
