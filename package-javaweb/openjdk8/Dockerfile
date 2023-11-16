FROM openjdk:8-jdk-alpine
#env pre
RUN { \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/main/'; \
        echo 'https://mirrors.aliyun.com/alpine/v3.9/community/'; \
    } > /etc/apk/repositories
RUN set -xe && apk --no-cache add ttf-dejavu fontconfig tzdata

ENV TZ Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

VOLUME /tmp
VOLUME /logs
VOLUME /app
ADD build/package/app.jar /app/app.jar
#ARG BUILD_EXPOSE=0
ENV appName1=${appName}
ENV runOptions1=${runOptions}
ENV runArgs1=${runArgs}

CMD java -Dapp.name=${appName1} ${runOptions1} -jar "/app/app.jar" ${runArgs1}

#ENTRYPOINT ["sh", "-c", "java -Dapp.name=${appName} ${runOptions} -jar /app/app.jar ${runArgs}"]
