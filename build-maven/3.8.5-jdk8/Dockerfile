FROM maven:3.8.5-ibmjava-8-alpine
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
# install mvnd
ARG MVND_VERSION=0.9.0
ARG DOWNLOAD_URL=https://cdn.jsdelivr.net/gh/wuzhaozhongguo/share-file@master/maven-mvnd-${MVND_VERSION}-linux-amd64.zip
RUN mkdir -p /usr/local/mvnd
RUN curl -fsSL -o mvnd.zip ${DOWNLOAD_URL}
RUN unzip  mvnd.zip -d /usr/local/mvnd
ENV MVND_HOME=/usr/local/mvnd/maven-mvnd-${MVND_VERSION}-linux-amd64
#ENV PATH=.:$MVND_HOME/bin:$PATH
ENV ln -s /usr/local/mvnd/maven-mvnd-${MVND_VERSION}-linux-amd64/bin/mvnd /usr/bin/mvnd

# clear
RUN rm -rf /var/lib/apt/lists/* && rm /var/cache/apk/*

#package
ENV BASE_PATH=/app
ENV PACKAGE_FOLDER_NAME=package
ENV CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["mvn", "-v", "&&", "mvnd", "-v"]
