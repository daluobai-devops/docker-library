FROM maven:3-amazoncorretto-8
RUN yum update -y && yum install -y \
    curl \
    openssh-clients \
    less \
    dejavu-sans-fonts \
    fontconfig \
    tar \
    bash \
    procps-ng \
    git \
    && yum clean all

RUN mkdir -p /root/.ssh && \
        touch /root/.ssh/known_hosts && \
        chmod 700 /root/.ssh && \
        chmod 600 /root/.ssh/known_hosts
COPY build/settings*.xml ${MAVEN_CONFIG}/

# 环境变量设置
ENV BASE_PATH=/app \
    PACKAGE_FOLDER_NAME=package \
    CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["mvn", "-v", "&&", "mvnd", "-v"]
