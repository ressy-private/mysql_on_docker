FROM centos:centos7

RUN yum remove mariadb-libs -y && \
    rm -rf /var/lib/mysql/ && \
    yum update -y && \
    yum localinstall http://dev.mysql.com/get/mysql57-community-release-el7-7.noarch.rpm -y && \
    yum install mysql-community-server -y && \

ADD bin/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

EXPOSE 3306

CMD ["/usr/local/bin/init.sh"]
