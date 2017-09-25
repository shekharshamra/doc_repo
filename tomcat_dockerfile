FROM centos:centos7
#installing java
ADD jdk-8u144-linux-x64.rpm /usr
ADD apache-tomcat-8.5.6.tar.gz /usr/local
#installing java
RUN yum install -y /usr/jdk-8u144-linux-x64.rpm
RUN yum install -y elinks
# installing tomcat
RUN cd /usr/local \
       tar -xvf apache-tomcat-8.5.6.tar.gz
CMD ["/usr/local/apache-tomcat-8.5.6/bin/catalina.sh", "run"]
