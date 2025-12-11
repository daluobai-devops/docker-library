FROM maven:3-jdk-7-alpine
#env pre
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && \
        apk add --upgrade apk-tools && \
        apk add --no-cache \
            curl openssh less ttf-dejavu fontconfig tar bash procps git libc6-compat

RUN mkdir -p /root/.ssh && \
        touch /root/.ssh/known_hosts && \
        chmod 700 /root/.ssh && \
        chmod 600 /root/.ssh/known_hosts
COPY build/settings*.xml ${MAVEN_CONFIG}/

# 安装 mvnd
ARG MVND_VERSION=0.9.0
ARG DOWNLOAD_URL=https://cdn.jsdelivr.net/gh/wuzhaozhongguo/share-file@master/attachment/maven-mvnd-${MVND_VERSION}-linux-amd64.zip
RUN mkdir -p /usr/local/mvnd && \
    curl -fsSL -o mvnd.zip ${DOWNLOAD_URL} && \
    unzip mvnd.zip -d /usr/local/mvnd && \
    rm mvnd.zip && \
    ln -s /usr/local/mvnd/maven-mvnd-${MVND_VERSION}-linux-amd64/bin/mvnd /usr/bin/mvnd

# 环境变量设置
ENV BASE_PATH=/app \
    PACKAGE_FOLDER_NAME=package \
    CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["/bin/bash", "-c", "mvn -v && mvnd -v"]
