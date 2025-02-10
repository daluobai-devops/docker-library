FROM maven:3-eclipse-temurin-11-alpine
#env pre
RUN { \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/main/'; \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/community/'; \
    } > /etc/apk/repositories
RUN apk update
RUN apk add --upgrade apk-tools

RUN apk add --no-cache curl openssh less ttf-dejavu fontconfig tar bash procps git bash xz libstdc++ libgcc

RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/*
COPY build/settings*.xml ${MAVEN_CONFIG}/
# 安装 Node.js 16.8.0
RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/v16.8.0/node-v16.8.0-linux-x64-musl.tar.xz -o /tmp/node.tar.xz \
    && ls -l /tmp \
    && tar -xJf /tmp/node.tar.xz -C /usr/local --strip-components=1 \
    && rm /tmp/node.tar.xz

#taobao镜像
RUN npm install -g cnpm --registry=https://registry.npmmirror.com
RUN npm config set registry https://mirrors.huaweicloud.com/repository/npm/ -g
RUN npm config set sass_binary_site https://npmmirror.com/mirrors/node-sass/ -g

# 验证 Node.js 和 npm 是否安装成功
RUN node -v && npm -v

#package
ENV BASE_PATH=/app
ENV PACKAGE_FOLDER_NAME=package
ENV CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["mvn", "-v", "&&", "node", "--version", "&&", "npm", "--version", "&&", "git", "--version"]
