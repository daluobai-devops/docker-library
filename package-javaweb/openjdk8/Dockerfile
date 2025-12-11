FROM openjdk:8-jdk-alpine
#env pre
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache ttf-dejavu fontconfig tzdata

# 2. 环境变量设置
ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

VOLUME ["/tmp", "/logs"]

COPY build/package/app.jar app.jar

# 提供了默认值，避免构建时未传参报错
ARG BUILD_EXPOSE=8080
ARG appName=app
ARG runOptions=""
ARG runArgs=""

# 将构建参数(ARG)持久化为环境变量(ENV)，以便在 CMD 运行时使用
ENV APP_NAME=${appName} \
    JAVA_OPTS=${runOptions} \
    APP_ARGS=${runArgs}

# 暴露端口
EXPOSE ${BUILD_EXPOSE}

# 8. 启动命令
# 显式添加 -Duser.timezone 确保 JVM 读取到正确时区
# 使用 Shell 格式 (不带 []) 以便解析环境变量
CMD java -Duser.timezone=${TZ} -Dapp.name=${APP_NAME} ${JAVA_OPTS} -jar app.jar ${APP_ARGS}
