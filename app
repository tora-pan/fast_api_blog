#!/bin/bash
CMD=$1
case $CMD in
  start)
    echo "Starting app"
    uvicorn main:app --reload
  ;;
  migrate)
    if [ -z "$2" ]; then
      echo "Available commands: init | run | add"
      elif [ "$2" == "init" ]; then
      echo "Initializing migration"
      alembic init -t async migrations
      elif [ "$2" == "add" ]; then
      if [ -z "$3" ]; then
        echo "Please provide a message for the migration"
      else
        echo "Creating migration"
        alembic revision --autogenerate -m "$3"
      fi
      elif [ "$2" == "run" ]; then
      echo "Running migration"
      alembic upgrade head
      elif [ "$2" == "rollback" ]; then
      echo "Rolling back migration"
      alembic downgrade -1
    else
      echo "Invalid command"
      echo "Available commands: init | run | add"
    fi
  ;;
  *)
    echo "$CMD is not a valid command"
  ;;
esac
