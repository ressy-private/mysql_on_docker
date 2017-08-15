# mysql_on_docker

## Usage

### Build Container

```console
$ git clone git@github.com:ressy-private/mysql_on_docker.git
$ cd mysql_on_docker
$ docker build -t sample/mysql .
$ docker run -d --privileged --name sample-mysql -p 3306:3306 sample/mysql
```

### Restore Database

```console
$ docker cp /path/to/sql_dump_file/ sample/mysql:/tmp/data
$ docker exec -it sample-mysql /usr/local/bin/mysql_setup.sh
$ docker exec -it sample-mysql /bin/bash
# mysql -uroot -p
mysql> source /tmp/data/sql_dump_file.sql;
```

### How to Connect to Databases from Host PC

```console
$ mysql -hlocalhost -u<username> -P 3306 --protocol=tcp -p
```
