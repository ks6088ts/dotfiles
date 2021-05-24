# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: install
install: install-brew install-brew-cask install-sh install-rc ## install

.PHONY: install-sh
install-sh: ## install via shell script
	sh scripts/install-macos.sh
	sh scripts/install-vscode-extensions.sh

.PHONY: install-brew
install-brew: ## install brew
	brew tap soracom/soracom-cli
	brew install \
		ansible \
		anyenv \
		curl \
		gh \
		git \
		go@1.16 \
		jq \
		kubectl \
		libpq \
		libusb \
		make \
		mosquitto \
		netcat \
		ngrok \
		node@14 \
		npm \
		peco \
		protobuf \
		python@3.8 \
		soracom-cli \
		tmux \
		unzip \
		wget \
		youtube-dl \
		zip \
		zsh \

.PHONY: install-brew-cask
install-brew-cask: ## install brew cask
	brew install --cask \
		visual-studio-code \
		google-chrome \
		slack \
		iterm2 \
		sourcetree \
		docker \
		arduino \

.PHONY: install-rc
install-rc: ## install run configs
	cp rc/.macos.zshrc ~/.zshrc

.PHONY: ci
ci: install ## ci test
