.PHONY: clean, install, update, init, format, lint, test, html, build, publish-test, publish, lab, optuna, mlflow, tensorboard

clean:
	-@rm -r .tox
	-@rm -r .venv
	-@rm -r dist
	-@rm -r htmlcov
	-@rm .coverage
	-@poetry run pre-commit clean

install:
	@poetry install
	@poetry run pre-commit install -f

update:
	@poetry update
	@poetry run pre-commit autoupdate

init:
	-@git init
	-@git add . --all -first
	-@git commit -m "first commit"

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

lab:
	@poetry run jupyter lab

optuna:
	@poetry run optuna-dashboard sqlite:///logs/optuna.db --host localhost

mlflow:
	@poetry run mlflow ui --backend-store-uri sqlite:///logs/mlflow.db --default-artifact-root models

tensorboard:
	@poetry run tensorboard --logdir ./logs