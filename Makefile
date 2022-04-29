.DEFAULT_GOAL := help
.PHONY: help virtualenv kind image deploy

VIRTUALENV ?= "./virtualenv/"
ANSIBLE = $(VIRTUALENV)/bin/ansible-playbook

help:
	@echo GLHF

virtualenv:
		LC_ALL=en_US.UTF-8 python3 -m venv $(VIRTUALENV)
		. $(VIRTUALENV)/bin/activate
		LC_ALL=en_US.UTF-8 $(VIRTUALENV)/bin/python3 -m pip install --upgrade pip
		LC_ALL=en_US.UTF-8 $(VIRTUALENV)/bin/pip3 install -r requirements.txt
		$(VIRTUALENV)/bin/ansible-galaxy collection install -r requirements.yml


create.proxy:
	$(ANSIBLE) -v create-proxy.yaml

