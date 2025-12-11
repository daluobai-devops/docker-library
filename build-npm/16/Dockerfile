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
RUN npm config set unsafe-perm true
#taobao镜像
RUN npm config set unsafe-perm true && \
    npm config set registry https://registry.npmmirror.com -g && \
    npm config set sass_binary_site https://npmmirror.com/mirrors/node-sass/ -g
RUN npm install -g cnpm --registry=https://registry.npmmirror.com

#package
ENV BASE_PATH=/app \
    PACKAGE_FOLDER_NAME=package \
    CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["node", "-v"]