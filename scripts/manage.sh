#!/bin/bash

case "$1" in
  stop-db)
    ./scripts/dev/stop-db.sh
    ;;
  start-db)
    ./scripts/dev/start-db.sh
    ;;
  reset-db)
    ./scripts/dev/reset-db.sh
    ;;
  makemigrations-migrate)
    ./scripts/makemigrations-migrate.sh
    ;;
  create-superuser)
    ./scripts/dev/create-superuser.sh
    ;;
  bootstrap-database)
    ./scripts/dev/bootstrap-database.sh
    ;;
  *)
    echo "Usage: $0 {stop-db|start-db|reset-db|makemigrations-migrate|create-superuser|bootstrap-database}"
    exit 1
    ;;
esac
