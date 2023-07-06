FROM centos:7
RUN yum -y install wget

RUN wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo && yum install -y epel-release && yum clean all && yum makecache && yum -y update

RUN yum -y install yum-utils make zlib zlib-devel gcc-c++ libtool  openssl openssl-devel vim lrzsz net-tools unzip zip bash-completion ntpdate psmisc fontconfig mkfontscale

RUN mkdir -p /usr/share/fonts/my_fonts

RUN source /usr/share/bash-completion/bash_completion

