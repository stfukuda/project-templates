# {{ cookiecutter.project_name }}

[![Ruff](https://img.shields.io/endpoint?url=https://raw.githubusercontent.com/astral-sh/ruff/main/assets/badge/v2.json)](https://github.com/astral-sh/ruff)

{{ cookiecutter.description }}

## Dependencies

To use this project, you need to install the following components:

- Python (>={{ cookiecutter.python_version }})
- Poetry
- Git (Option)
- Make (Option)

## Project Organization

./
├── .devcontainer            <- Configuration files for creating Dev Container in VSCode.
├── .vscode                  <- Configuration files for VSCode.
├── configs                  <- Configuration files for hydra.
├── data
│   ├─ external              <- Data from third party sources.
│   ├─ interim               <- Intermediate data that has been transformed.
│   ├─ processed             <- The final, canonical data sets for modeling.
│   └─ raw                   <- The original, immutable data dump.
├── docs                     <- Configuration files and folders for Sphinx.
├── logs                     <- Training log, lint log file.
├── models                   <- Trained and serialized models or model predictions, model summaries.
├── notebooks                <- Jupyter notebooks. Naming convention is a number (for ordering),
│                               the creator's initials, and a short `-` delimited description, e.g.
│                               `1.0-initial-data-exploration.ipynb`.
├── references               <- Data dictionaries, manuals, and all other explanatory materials.
├── reports                  <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures              <- Generated graphics and figures to be used in reporting.
├── src
│   ├── data                 <- Scripts to download or generate data.
│   ├── features             <- Scripts to turn raw data into features for modeling.
│   ├── models               <- Scripts to train models and then use trained models to make predictions.
│   └── visualization        <- Scripts to create exploratory and results oriented visualizations.
├── .env_sample              <- Sample file of environment variable to be loaded by docker-compose.yml and python-dotenv libraries.
├── .flake8                  <- Configuration file for flake8.
├── .gitattributes           <- A file that sets a line feed code for each specified file in Git.
├── .gitignore               <- Files for setting files that you want to intentionally exclude from tracking in the Git repository.
├── .pre-commit-config.yaml  <- Configuration file to perform formatting and other checks on Git commits.
├── LICENSE                  <- License file.
├── Makefile                 <- Makefile with commands like `make` or `make setup`...
├── poetry.toml              <- Configuration file for environment management in Poetry.
├── pyproject.toml           <- The requirements file for reproducing the analysis environment.
└── README.md                <- The top-level README for developers using this project.

--------

## Credits

Project based on the [cookiecutter data science project template.](https://drivendata.github.io/cookiecutter-data-science/) #cookiecutterdatascience

## License

[{{ cookiecutter.license }} License](LICENSE)
