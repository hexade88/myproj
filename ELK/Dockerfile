FROM centos:centos7
COPY *.rpm .
RUN sudo yum -y install java-openjdk-devel java-openjdk
RUN rpm -i *.rpm
