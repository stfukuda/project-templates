.PHONY: setup, install, update, format, lint, test, html, build, clean, lab, optuna, mlflow, tensorboard

setup:
	@git init
	@git commit --allow-empty -m "Initial commit"
	@git checkout -b develop
	@git checkout -b setup
	@git add .
	@git commit -m "chore: 🤖 add template folder"
	@poetry install --with dev,cqa,test,docs
	@git add poetry.lock
	@git commit -m "chore: 🤖 add poetry.lock"
	@pre-commit install
	@pre-commit autoupdate
	@git add .pre-commit-config.yaml
	@git commit -m "chore: 🤖 update pre-commit hooks revision or tag"
	@git checkout develop
	@git merge setup
	@git branch -d setup

install:
	@poetry install --with dev,cqa,test,docs
	@pre-commit install

update:
	@poetry update
	@pre-commit autoupdate

format:
	-@isort ./src ./tests
	-@black ./src ./tests

lint:
	-@flake8 ./src ./tests --color auto
	-@bandit -r ./src ./tests

test:
	@pytest --cov=src --cov-report=term-missing --cov-report=html -n 4

html:
	@sphinx-build -b html ./docs/source ./docs

build:
	@git checkout main
	@poetry build

lab:
	@jupyter lab --allow-root --ip="*" --poert=8888 --no-browser

optuna:
	@optuna-dashboard sqlite:///logs/optuna.db --host localhost

mlflow:
	@mlflow ui --backend-store-uri sqlite:///logs/mlflow.db --default-artifact-root models

tensorboard:
	@tensorboard --logdir ./logs