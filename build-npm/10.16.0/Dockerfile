FROM node:10.16.0-alpine
RUN { \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/main/'; \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/community/'; \
    } > /etc/apk/repositories
RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash \
                   bash-doc \
                   bash-completion \
                   curl \
                   openssh \
                   less \
                   ttf-dejavu \
                   fontconfig \
                   zip \
                   git \
                   && /bin/bash && rm -rf /var/lib/apt/lists/* && rm /var/cache/apk/*
#taobao镜像
RUN npm install -g cnpm --registry=https://registry.npmmirror.com
RUN npm config set registry https://registry.npmmirror.com -g
RUN npm config set sass_binary_site https://npmmirror.com/mirrors/node-sass/ -g
#package
ENV BASE_PATH=/app
ENV PACKAGE_FOLDER_NAME=package
ENV CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
