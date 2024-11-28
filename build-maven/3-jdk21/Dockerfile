FROM maven:3-eclipse-temurin-21-alpine
#env pre
RUN { \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/main/'; \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/community/'; \
    } > /etc/apk/repositories
RUN apk update
RUN apk add --upgrade apk-tools

RUN apk add curl openssh less ttf-dejavu fontconfig tar bash procps git

RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/*
COPY build/settings*.xml ${MAVEN_CONFIG}/

# clear
RUN rm -rf /var/lib/apt/lists/* && rm /var/cache/apk/*

#package
ENV BASE_PATH=/app
ENV PACKAGE_FOLDER_NAME=package
ENV CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["mvn", "-v"]
