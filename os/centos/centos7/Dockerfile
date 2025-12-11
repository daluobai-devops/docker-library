FROM centos:7
# 1. 修复 Yum 源 (关键步骤)
# CentOS 7 已 EOL，必须先切换到阿里云源。
# 镜像自带 curl，所以直接用 curl 下载 repo 文件，替换默认的坏源。
# 移除了阿里云内网源地址 (mirrors.aliyuncs.com)，防止在非阿里云环境下报错。
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo && \
    sed -i -e '/mirrors.cloud.aliyuncs.com/d' -e '/mirrors.aliyuncs.com/d' /etc/yum.repos.d/CentOS-Base.repo && \
    yum makecache

# 2. 安装 EPEL 源和常用工具
# - 合并 RUN 指令以减少镜像层数
# - 移除了 ntpdate：容器共享宿主机内核时间，不应在容器内同步时间，且无法通过 cap_sys_time 权限修改
# - 增加了清理命令 (yum clean all) 以减小体积
RUN yum install -y epel-release && \
    yum install -y \
    wget vim lrzsz net-tools unzip zip \
    gcc-c++ libtool make zlib zlib-devel openssl openssl-devel \
    bash-completion psmisc fontconfig mkfontscale && \
    yum clean all && \
    rm -rf /var/cache/yum

# 3. 字体配置
RUN mkdir -p /usr/share/fonts/my_fonts && \
    mkfontscale && \
    mkfontdir && \
    fc-cache -fv

# 4. 配置 Bash 自动补全
# 原来的 "RUN source ..." 是无效的，因为 RUN 在独立的 shell 中运行，结束后环境变量就丢了。
# 正确做法是写入 .bashrc，这样你进入容器交互时才会生效。
RUN echo "source /usr/share/bash-completion/bash_completion" >> /root/.bashrc

# 5. (可选) 设置时区，解决容器时间不对的问题
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

CMD ["/bin/bash"]