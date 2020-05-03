FROM centos:7
MAINTAINER Jason Viloria jnvilo@mgail.com 

RUN yum -y install rsync crontabs
COPY entrypoint.sh entrypoint.sh 

ENTRYPOINT ["/bin/bash","/entrypoint.sh"]


