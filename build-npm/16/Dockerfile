FROM node:16-alpine3.17
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN apk add --no-cache \
        bash \
        curl \
        openssh \
        git \
        zip \
        less \
        ttf-dejavu \
        fontconfig
#taobao镜像
RUN echo "registry=https://registry.npmmirror.com" > ~/.npmrc && \
    echo "sass_binary_site=https://npmmirror.com/mirrors/node-sass/" >> ~/.npmrc \

RUN npm install -g cnpm

#package
ENV BASE_PATH=/app \
    PACKAGE_FOLDER_NAME=package \
    CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["node", "-v"]