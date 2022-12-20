.PHONY: install, update, format, lint, test, html, build, publish-test, publish, clean, lab, optuna, mlflow, tensorboard

install:
	@git init
	@git commit --allow-empty -m "Initial commit"
	@git add .
	@git commit -m "Add template folder"
	@git checkout -b dev
	@poetry install
	@git add .
	@git commit -m "Add poetry.lock"
	@poetry run pre-commit install
	@poetry run pre-commit autoupdate
	@git add .
	@git commit -m "Update hooks revision or tag"

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

lab:
	@poetry run jupyter lab

optuna:
	@poetry run optuna-dashboard sqlite:///logs/optuna.db --host localhost

mlflow:
	@poetry run mlflow ui --backend-store-uri sqlite:///logs/mlflow.db --default-artifact-root models

tensorboard:
	@poetry run tensorboard --logdir ./logs