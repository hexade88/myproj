FROM centos:centos7
COPY ./*.rpm /
RUN yum -y install java-openjdk-devel java-openjdk
COPY ./jvm.options /etc/elasticsearch/jvm.options.d/jvm.options