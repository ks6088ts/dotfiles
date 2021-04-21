DOCKER_RUN_NAME ?= ubuntu
DOCKER_RUN_COMMAND ?= zsh

ANSIBLE_PLAYBOOK ?= playbooks/ubuntu.yml

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.DEFAULT_GOAL := help

.PHONY: docker-build
docker-build: ## build docker
	docker-compose build

.PHONY: docker-run
docker-run: ## run docker
	docker-compose run --rm $(DOCKER_RUN_NAME) $(DOCKER_RUN_COMMAND)

# https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: install
install: install-apt install-ansible install-sh install-rc ## install

.PHONY: install-apt
install-apt: ## install via apt
	sudo apt-get install -y \
		make \
		ansible \
		curl \
		git \
		jq \
		mosquitto-clients \
		netcat \
		peco \
		postgresql-client \
		protobuf-compiler \
		python3-pip \
		software-properties-common \
		sudo \
		tmux \
		unzip \
		wget \
		zip \
		zsh \

.PHONY: install-ansible
install-ansible: ## install via ansible
	# install ansible role
	ansible-galaxy install \
		gantsign.golang \
		geerlingguy.nodejs
	# install playbook
	ansible-playbook $(ANSIBLE_PLAYBOOK) \
		-i inventories/hosts \
		--ask-become-pass \
		--verbose

.PHONY: install-sh
install-sh: ## install via shell script
	sh scripts/install-ubuntu.sh

.PHONY: install-rc
install-rc: ## install run configs
	cp rc/.ubuntu.zshrc ~/.zshrc

.PHONY: ci
ci: install ## ci test
