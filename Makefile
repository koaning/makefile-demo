.PHONY: docs

help:
	@echo "available commands"
	@echo " - install    : installs all requirements"
	@echo " - dev        : installs all development requirements"
	@echo " - test       : run all unit tests"
	@echo " - clean      : cleans up all folders"
	@echo " - flake      : runs flake8 style checks"
	@echo " - check      : runs all checks (tests + style)"
	@echo " - docs       : generate docs locally in /docs folder"

install: 
	pip install -r requirements.txt

dev: install
	pip install -r dev-requirements.txt

test:
	pytest tests.py

clean:
	rm -rf __pycache__ .pytest_cache

flake:
	flake8 common.py tests.py

check: flake test clean

docs:
	pdoc --html --force --output-dir docs common