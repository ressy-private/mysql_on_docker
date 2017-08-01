# mysql_on_docker

## Usage

### Build Container

```console
$ git clone git@github.com:ressy-private/mysql_on_docker.git
$ cd mysql_on_docker
$ docker build -t sample/mysql:0.0 .
$ docker run -d --privileged --name sample-mysql -p 3306:3306 -v /path/to/sql_dump_file/:/tmp/data sample/mysql:0.0
$ docker exec -it sample-mysql /bin/bash
```

### Restore Database

```console
# sh /usr/local/bin/mysql_setup.sh
# mysql -uroot -p
mysql> source /tmp/data/sql_dump_file.sql;
```

### How to Connect to Databases from Host PC

```console
$ mysql -hlocalhost -u<username> -P 3306 --protocol=tcp -p
```
