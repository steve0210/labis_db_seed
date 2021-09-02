FROM centos:7.8.2003

RUN yum update -y \
  && yum install -y \
  ca-certificates \
  gnupg2 \
  procps \
  curl \
  gcc \
  gcc-c++ \
  glibc-devel \
  make \
  which \
  wget \
  less \
  libcurl-devel \
  https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm \
  && yum-config-manager --disable mysql80-community \
  && yum-config-manager --enable mysql57-community \
  && yum install -y \
  mysql-community-client \
  mysql-community-libs \
  mysql-community-devel \
  && yum clean all

RUN command curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s
RUN /bin/bash -l -c ". /etc/profile.d/rvm.sh && rvm install 2.0.0"

WORKDIR /tmp
RUN useradd -ms /bin/bash -G rvm,disk rails \
  && mkdir -p /home/rails/tmp

COPY Gemfile* /home/rails/tmp/
RUN chown -R rails:rails /home/rails \
  && su - rails -c 'cd /home/rails/tmp && bundle'

COPY my.cnf /home/rails/.my.cnf
WORKDIR /var/www/labis_db_seed/current
COPY . .
RUN chown -R rails:rails /var/www/labis_db_seed
