.PHONY: install, update, format, lint, test, html, build, publish-test, publish, clean

install:
	@git init
	@git commit --allow-empty -m "Initial commit"
	@git checkout -b dev
	@git add .
	@git commit -m "Add template folder"
	@poetry install
	@poetry run pre-commit install
	@poetry run pre-commit autoupdate
	@git add .
	@git commit -m "Add poetry.lock file" -m "Generate virtual enviroment."

update:
	@poetry update
	@poetry run pre-commit autoupdate

format:
	-@poetry run isort ./src ./tests
	-@poetry run black ./src ./tests

lint:
	-@poetry run flake8 ./src ./tests --color auto
	-@poetry run bandit -r ./src ./tests

test:
	@poetry run tox

html:
	@poetry run sphinx-build -b html ./docs/source ./docs

build:
	@poetry build

publish-test:
	@poetry publish -r test-pypi

publish:
	@poetry publish

clean:
	-@poetry run pre-commit clean
	-@rm -rf .venv
	-@rm -rf .tox
	-@rm -rf dist
	-@rm -rf htmlcov
	-@rm -rf .coverage
