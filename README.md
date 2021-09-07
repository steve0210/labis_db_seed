# README

For CPL LabIS there are two environments:
- `labis_production` to pull data from the production database in order to create seed files
- `labis_test` to populate a test database with seed data

## List of tables
`./config/tables/labis_production.yml`
contains a list of tables to copy from the `labis_production` database.

## Schema dump
`RAILS_ENV=labis_production rake db:schema_dump_cp`
dumps the schema of the `labis_production` database into the ruby schema file `./db/labis_production.schema.rb`

## Create seed files
`RAILS_ENV=labis_production rake db:create_seed_files`
places seed data into ruby files in the `./db/seeds/labis_test` directory

## Start mysql container
After deploying to `/var/www/labis_db_seed/current` start the database container with `docker-compose up -d mysqldb`.

The database root password is copied from the variable `$DB_ROOT_PASSWORD` into the `./docker-compose.yml` file which is then used by the mysql container.

The container mounts the data directory from the host at `/opt/docker/volumes/mysql`

## Seed the mysql container
`docker-compose run labis_db_seed /var/www/labis_db_seed/current/bin/docker/entrypoint_labis_test.sh`
seeds the database in the mysql container by running the `db:data_load` rake task in the `labis_test` environment.

The mysql container server is named `mysqldb` on the local docker network.

The rake task creates the database and the user specified in the `database.yml` if they do not exist, then the data is seeded.
