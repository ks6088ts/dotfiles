# /////////////////////////////
# https://github.com/zdharma/zinit#option-1---automatic-installation-recommended

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

# /////////////////////////////
# https://github.com/zdharma/zinit#example-usage

# Two regular plugins loaded without investigating.
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

# Plugin history-search-multi-word loaded with investigating.
zinit load zdharma/history-search-multi-word

# Load the pure theme, with zsh-async library that's bundled with it.
zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# A glance at the new for-syntax – load all of the above
# plugins with a single command. For more information see:
# https://zdharma.github.io/zinit/wiki/For-Syntax/
zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \
    light-mode pick"async.zsh" src"pure.zsh" \
                sindresorhus/pure

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

# One other binary release, it needs renaming from `docker-compose-Linux-x86_64`.
# This is done by ice-mod `mv'{from} -> {to}'. There are multiple packages per
# single version, for OS X, Linux and Windows – so ice-mod `bpick' is used to
# select Linux package – in this case this is actually not needed, Zinit will
# grep operating system name and architecture automatically when there's no `bpick'.
zinit ice from"gh-r" as"program" mv"docker* -> docker-compose" bpick"*linux*"
zinit load docker/compose

# Vim repository on GitHub – a typical source code that needs compilation – Zinit
# can manage it for you if you like, run `./configure` and other `make`, etc. stuff.
# Ice-mod `pick` selects a binary program to add to $PATH. You could also install the
# package under the path $ZPFX, see: http://zdharma.org/zinit/wiki/Compiling-programs
zinit ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zinit light vim/vim

# Scripts that are built at install (there's single default make target, "install",
# and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
# `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
zinit ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
zinit light tj/git-extras

# For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
# coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
zinit ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zinit light trapd00r/LS_COLORS

# make'!...' -> run make before atclone & atpull
zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' src"zhook.zsh"
zinit light direnv/direnv

# /////////////////////////////
# Personal

# zinit self-update

# ---
# alias
# ---

alias gitp='git push origin `git rev-parse --abbrev-ref HEAD`'
alias k=kubectl
alias s=soracom
alias mytask="club find --quiet --owner shinji --state 'Started' --format $'%id\t%t\n\t%u\n\t%epic'"

# ---
# environment variables
# ---

# common
# export http_proxy=
# export https_proxy=
eval "$(anyenv init -)"

# golang
export GOROOT=$(go env GOROOT)
export GOPATH=$(go env GOPATH)
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# python
export PATH=/usr/local/opt/python@3.8/bin:$PATH

# rust
export PATH=$HOME/.cargo/bin:$PATH

# git
export GIT_USER_NAME=ks6088ts
export GIT_USER_EMAIL=ks6088ts@gmail.com

# ---
# git
# ---
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_USER_EMAIL
git config --global ghq.root $GOPATH/src
# git config --list

cat <<EOS
GIT_USER_NAME = ${GIT_USER_NAME}
GIT_USER_EMAIL = ${GIT_USER_EMAIL}
EOS

# ---
# Android
# ---

export ANDROID_SDK_ROOT=~/Library/Android/sdk
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$PATH
export PATH=$ANDROID_SDK_ROOT/tools/bin:$PATH
export PATH=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home/bin:$PATH

# ---
# auto complete
# ---

autoload -U compinit
compinit -i

# aws cli
# https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-completion.html
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# ---
# settings
# ---

setopt no_beep

# ---
# bindkey
# ---
# incremental search
#   ref. https://qiita.com/strsk/items/9151cef7e68f0746820d
function peco-src () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
