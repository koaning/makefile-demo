.PHONY: docs

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