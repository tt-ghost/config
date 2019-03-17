FROM centos:7
# Centos 7.2
LABEL maintainer="Orange <ttghost@126.com>"
LABEL name="CentOS7.2 Base Image"

COPY init.sh /
RUN /init.sh 8.9.1
COPY nginx.conf /etc/nginx/.

# 设置系统环境变量，所有用户都可读到
ENV WORKSPACE="/workspace"

EXPOSE 22 8080
