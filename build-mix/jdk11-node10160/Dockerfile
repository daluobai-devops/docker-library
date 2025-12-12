FROM maven:3-eclipse-temurin-11-alpine
#env pre
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk update && \
        apk add --upgrade apk-tools && \
        apk add --no-cache \
            curl openssh less ttf-dejavu fontconfig tar bash procps git bash xz libstdc++ libgcc libc6-compat

RUN mkdir -p /root/.ssh && \
        touch /root/.ssh/known_hosts && \
        chmod 700 /root/.ssh && \
        chmod 600 /root/.ssh/known_hosts
COPY build/settings*.xml ${MAVEN_CONFIG}/
# 安装 Node.js v10.16.0
ARG NODE_VERSION=v10.16.0
ARG NODE_DISTRO=linux-x64-musl
RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/${NODE_VERSION}/node-${NODE_VERSION}-${NODE_DISTRO}.tar.xz -o node.tar.xz \
    && tar -xJf node.tar.xz -C /usr/local --strip-components=1 \
    && rm node.tar.xz \
    && node -v && npm -v

#taobao镜像
RUN echo "registry=https://registry.npmmirror.com" > ~/.npmrc && \
    echo "sass_binary_site=https://npmmirror.com/mirrors/node-sass/" >> ~/.npmrc

RUN npm install -g cnpm

#package
ENV BASE_PATH=/app \
    PACKAGE_FOLDER_NAME=package \
    CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["/bin/bash", "-c", "mvn -v && node -v && npm -v && git --version"]