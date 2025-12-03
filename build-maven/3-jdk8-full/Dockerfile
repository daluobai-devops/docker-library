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

RUN mkdir /root/.ssh/
RUN touch /root/.ssh/known_hosts
RUN chmod 700 /root/.ssh && chmod 600 /root/.ssh/*
COPY build/settings*.xml ${MAVEN_CONFIG}/
#package
ENV BASE_PATH=/app
ENV PACKAGE_FOLDER_NAME=package
ENV CODE_FOLDER_NAME=code
RUN mkdir -p ${BASE_PATH} && mkdir -p ${BASE_PATH}/${PACKAGE_FOLDER_NAME} && mkdir -p ${BASE_PATH}/${CODE_FOLDER_NAME}
CMD ["mvn", "-v", "&&", "mvnd", "-v"]
