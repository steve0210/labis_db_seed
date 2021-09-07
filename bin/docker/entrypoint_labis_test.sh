#!/bin/sh

APP_ENV=labis_vanilla_mercator_test
SERVICE=labis_db_seed
DIR=/var/www/$SERVICE/current

su - rails -c "cd $DIR && RAILS_ENV=$APP_ENV rake db:data_load"
