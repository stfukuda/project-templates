default: help

.PHONY: help
help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  setup   Setup the project dependencies"
	@echo "  update  Update the project dependencies"
	@echo "  check   Run formatters and linters to the source code"
	@echo "  docs    Build the project documentation"
	@echo "  build   Build the project to python package and upload to pypi"
	@echo "  lab     Launch jupyterlab"
	@echo "  clean   Clean up generated files"

.PHONY: setup
setup:
	@if [ -d ./.git ]; then \
		echo "Setup is already done."; \
	else \
		if command -v git &> /dev/null; then \
			git init; \
			git commit --allow-empty -m "initial commit"; \
			git checkout -b develop; \
			git add .; \
			git commit -m "add template folder"; \
			poetry install --with dev,docs,ide; \
			poetry export -f requirements.txt --output requirements.txt --without-hashes --without-urls; \
			poetry export -f requirements.txt --output requirements-dev.txt --without-hashes --without-urls --with dev,docs,ide; \
			git add poetry.lock requirements.txt requirements-dev.txt; \
			git commit -m "add poetry.lock"; \
			poetry run pre-commit install; \
			poetry run pre-commit autoupdate; \
			git add .pre-commit-config.yaml; \
			git commit -m "update pre-commit hooks revision or tag"; \
		else \
			poetry install --with dev,docs,ide; \
		fi; \
		echo "Setup is complete."; \
	fi

.PHONY: update
update:
	@poetry update --with dev,docs,ide
	@poetry export -f requirements.txt --output requirements.txt --without-hashes --without-urls
	@poetry export -f requirements.txt --output requirements-dev.txt --without-hashes --without-urls --with dev,docs,ide
	@poetry run pre-commit autoupdate

.PHONY: check
format:
	-@poetry run ruff format ./src
	-@poetry run ruff check ./src --fix
	-@poetry run bandit -c pyproject.toml -r ./src

.PHONY: docs
docs:
	@poetry run sphinx-build -b html ./docs/source ./docs

.PHONY: build
build:
	@branch_name=$$(git rev-parse --abbrev-ref HEAD); \
	git checkout main; \
	poetry build; \
	git checkout $$branch_name

.PHONY: lab
lab:
	{% if cookiecutter.use_docker -%}
	@poetry run jupyter lab --allow-root --ip="*" --poert=8888 --no-browser
	{%- else -%}
	@poetry run jupyter lab
	{%- endif %}

.PHONY: clean
clean:
	-@find ./ -name "__pycache__" -exec rm -rf {} \;
