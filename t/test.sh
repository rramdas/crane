#!/bin/bash

### Set up databases

## Postgres

sudo -u postgres dropdb crane_test_db
sudo -u postgres createdb crane_test_db
sudo -u postgres psql -c \
    "CREATE USER crane_test_user WITH PASSWORD 'crane_test_user'"
sudo -u postgres psql -c \
    "GRANT ALL PRIVILEGES ON DATABASE crane_test_db TO crane_test_user"

## MySQL

### Run the tests
sudo sbcl --noinform --eval '(ql:quickload :crane-test)' \
  --quit

### Tear down
sudo -u postgres dropdb crane_test_db
