# Python Package Template

Python package project template.

## Steps

1. Clone this project and rename.

   ```sh
   git clone git@github.com:takelushi/py-pkg-template.git
   mv py-pkg-template <YOUR_REPOSITORY_NAME>
   ```

1. Initialize poetry project and edit

   ```sh
   rm pyproject.toml
   poetry init
   # Edit pyproject.toml.
   # Example: pyproject.example.toml
   vi pyproject.toml
   # Remove example.
   rm pyproject.example.toml
   ```

1. Add development requirements

   ```sh
   # Edit text
   vi dev-requirements.txt
   # Install
   cat dev-requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | xargs -n 1 poetry add --dev
   # Remove text
   rm dev-requirements.txt
   ```

2. Add requirements

   ```sh
   # Edit text
   vi requirements.txt
   # Install
   cat dev-requirements.txt | grep -E '^[^# ]' | cut -d= -f1 | xargs -n 1 poetry add
   # Remove text
   rm requirements.txt
   ```

3. Rename folders.
   * Replace `./src/pkg_name` to your package import name.
   * Replace `./tests/pkg_name` to your package import name.
4. Edit `pyproject.toml`
   * Replace **OWNER/REPO_NAME** to your repostory name.
   * Replace **pkg-name** to your package name.
   * Repkace **pkg_name** to your package import name.
   * Update `tool.poetry`
5. Edit `.flake8` for your project.
   * Replace **pkg_name** to your package import name.
6. Integrate to CircleCI. (If you want)

## Development

* Requirements: poetry, pyenv

```sh
# Setup
poetry install

# Lint & Test
mkdir -p report
poetry run flake8 --format=html --htmldir=report/flake-report .
mypy src/ tests/ --html-report report/mypy
poetry run pytest \
   --html=report/pytest/index.html\
   --cov-report html:report/coverage

# Build and publish
poetry build
poetry publish
```
