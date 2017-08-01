FROM centos:centos7

RUN yum remove mariadb-libs -y && \
    rm -rf /var/lib/mysql/ && \
    yum update -y && \
    yum localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm -y && \
    yum install mysql-community-server -y

ADD conf/etc/my.cnf /etc/my.cnf
ADD conf/root/dot_my.cnf /root/.my.cnf
ADD bin/mysql_setup.sh /usr/local/bin/mysql_setup.sh
RUN chmod 600 /root/.my.cnf
RUN chmod +x /usr/local/bin/mysql_setup.sh

VOLUME /tmp/data/

EXPOSE 3306

CMD ["/sbin/init"]
