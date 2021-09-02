SERVICE=labis_db_seed
APP_ENV=labis_vanilla_test
APP=${SERVICE}_app
IMG=${SERVICE}:latest
DIR=$(pwd)
NETWORK=my-net

docker network ls | grep $NETWORK || docker network create $NETWORK

for dir in $(find $DIR -mindepth 1 -type l); do
  link=$(readlink $dir)
  if [ -d $link ]; then
    rm $dir && mkdir $dir
  elif [ "$(basename $(dirname $dir))" = "config" ]; then
    echo "Copy link $link"
    rm $dir && cp $link $dir
  fi
done

FILE=./docker-compose.yml
echo "Creating $FILE"
cat > $FILE <<EOF
version: "3.8"

services:
  $SERVICE:
    image: $IMG
    build: $DIR
    container_name: $APP
    tty: true
    networks:
      - $NETWORK
  mysqldb:
    image: mysql:5.7
    ports:
      - 3306:3306
    environment:
      MYSQL_ROOT_PASSWORD: $DB_ROOT_PASSWORD
    volumes:
      - "./config/mysql/source.cnf:/etc/mysql/conf.d/source.cnf"
      - type: bind
        source: /opt/docker/volumes/mysql
        target: /var/lib/mysql
    networks:
      - $NETWORK
  mysqldb_slave:
    image: mysql:5.7
    ports:
      - 3306:3306
    environment:
      MYSQL_ROOT_PASSWORD: $DB_ROOT_PASSWORD
    volumes:
      - "./config/mysql/repl.cnf:/etc/mysql/conf.d/repl.cnf"
      - type: bind
        source: /opt/docker/volumes/mysql
        target: /var/lib/mysql
    networks:
      - $NETWORK
networks:
  ${NETWORK}:
    external: true
EOF

FILE=./my.cnf
echo "Creating $FILE"
cat > $FILE <<EOF
[client]
password=$DB_ROOT_PASSWORD

EOF
