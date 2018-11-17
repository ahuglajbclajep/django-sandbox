#!/bin/bash

# This script is based on https://github.com/google/yapf/blob/39e0290b2b0f9f678122391d29da6733081b99b9/plugins/pre-commit.sh.

# Find all added or modified staged Python files.
PYTHON_FILES=(`git diff --name-only --cached --diff-filter=AM | grep --color=never '.py$'`)
if [ ! "$PYTHON_FILES" ]; then
  exit 0
fi

# Check for existence of isort and yapf.
if [ -z '$(pipenv run which isort yapf flake8)' ]; then
  echo 'commands not on path. Please install: pipenv install -d'
  exit 2
fi

# Format and lint Python files, and add these.
set -e
echo 'Formatting staged Python files . . .'
pipenv run isort -q ${PYTHON_FILES[@]}
pipenv run yapf -i ${PYTHON_FILES[@]}

echo 'Linting staged Python files . . .'
pipenv run flake8 ${PYTHON_FILES[@]}

git add ${PYTHON_FILES[@]}
exit 0
