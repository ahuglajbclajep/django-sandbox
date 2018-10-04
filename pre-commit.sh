#!/bin/bash

# This script is based on https://github.com/google/yapf/blob/39e0290b2b0f9f678122391d29da6733081b99b9/plugins/pre-commit.sh.

# Find all added or modified staged Python files.
PYTHON_FILES=(`git diff --name-only --cached --diff-filter=AM | grep --color=never '.py$'`)
if [ ! "$PYTHON_FILES" ]; then
  exit 0
fi

# Check for existence of yapf.
if [ -z $(pipenv run which yapf) ]; then
  echo 'yapf not on path. Please install yapf: pipenv install -d'
  exit 2
fi

# Format Python files, and add these.
echo 'Formatting staged Python files . . .'
pipenv run yapf -i -r ${PYTHON_FILES[@]}
git add ${PYTHON_FILES[@]}
exit 0