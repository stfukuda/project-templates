.PHONY: setup
setup:
	ifeq ("$(.git)", "")
		@git init
		@git commit --allow-empty -m "initial commit"
		@git checkout -b develop
		@git add .
		@git commit -m "chore: 🤖 add template folder"
		@poetry install --with dev,test,docs,ide
		@git add poetry.lock
		@git commit -m "chore: 🤖 add poetry.lock"
		@pre-commit install
		@pre-commit autoupdate
		@git add .pre-commit-config.yaml
		@git commit -m "chore: 🤖 update pre-commit hooks revision or tag"
		@echo "Setup is complete."
	else
		@echo "Setup is already done."
	endif

.PHONY: update
update:
	@poetry update --with dev,test,docs
	@pre-commit autoupdate

.PHONY: format
format:
	-@isort ./src ./tests
	-@black ./src ./tests

.PHONY: lint
lint:
	-@flake8 ./src ./tests --color auto
	-@bandit -c pyproject.toml -r ./src ./tests

.PHONY: test
test:
	@pytest --cov=src --cov-report=term-missing --cov-report=html -n 4

.PHONY: html
html:
	@sphinx-build -b html ./docs/source ./docs

.PHONY: build
build:
	@git checkout main
	@poetry build

.PHONY: clean
clean:
	-@rm -rf .pytest_cache
	-@rm -rf dist
	-@rm -rf htmlcov
	-@find ./ -name "__pycache__" -exec rm -rf {} \;
	-@rm -rf .coverage

.PHONY: lab
lab:
	@jupyter lab --allow-root --ip="*" --poert=8888 --no-browser
