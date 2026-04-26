# docker-library
docker 镜像
# 文档

登录阿里云和dockerhub
-   docker login -u="账号" "registry.cn-hangzhou.aliyuncs.com" -p="密码"
-   docker login

打包多CPU架构执行这个
docker run --privileged --rm tonistiigi/binfmt --install all
