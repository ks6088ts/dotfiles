# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: install
install: install-sh install-brew install-brew-cask install-rc ## install

.PHONY: install-sh
install-sh: ## install via shell script
	sh scripts/install-macos.sh

.PHONY: install-brew
install-brew: ## install brew
	brew install \
		make \
		ansible \
		curl \
		git \
		jq \
		mosquitto \
		peco \
		libpq \
		python@3.8 \
		tmux \
		unzip \
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

.PHONY: install-rc
install-rc: ## install run configs
	# cp rc/.zshrc ~/.zshrc

.PHONY: ci
ci: install ## ci test
