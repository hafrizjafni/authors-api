build:
	docker compose -f local.yaml up --build -d --remove-orphans

up:
	docker compose -f local.yaml up -d

down:
	docker compose -f local.yaml down

show-logs:
	docker compose -f local.yaml logs

show-logs-api:
	docker compose -f local.yaml logs api

makemigrations:
	docker compose -f local.yaml run --rm api python manage.py makemigrations

migrate:
	docker compose -f local.yaml run --rm api python manage.py migrate

collectstatic:
	docker compose -f local.yaml run --rm api python manage.py collectstatic --no-input --clear

superuser:
	docker compose -f local.yaml run --rm api python manage.py createsuperuser

down-v:
	docker compose -f local.yaml down -v

volume:
	docker volume inspect src_local_postgres_data

authors-db:
	docker compose -f local.yaml exec postgres psql --username=hafriz --dbname=authors-live

flake8:
	docker compose -f local.yaml exec api flake8 .

black-check:
	docker compose -f local.yaml exec api black --check --exclude=makemigrations .

black-diff:
	docker compose -f local.yaml exec api black --diff --exclude=makemigrations.

black:
	docker compose -f local.yaml exec api black --exclude=makemigrations .

isort-check:
	docker compose -f local.yaml exec api isort . --check-only --skip venv --skip migrations

isort-diff:
	docker compose -f local.yaml exec api isort . --diff --skip venv --skip migrations

isort:
	docker compose -f local.yaml exec api isort . --skip venv --skip migrations
