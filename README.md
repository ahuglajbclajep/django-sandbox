# django-sandbox

Sandbox of [Django](https://www.djangoproject.com).

## Usage

Require [pipenv](https://github.com/pypa/pipenv) and [pyenv](https://github.com/pyenv/pyenv).

```sh
pipenv install && pipenv run python manage.py migrate

# Starts a lightweight development Web server on the localhost:8080.
pipenv run python manage.py runserver
```

## Development

```sh
pipenv install -d && chmod a+x pre-commit.sh && mkdir -p .git/hooks && cp pre-commit.sh .git/hooks/pre-commit
```
