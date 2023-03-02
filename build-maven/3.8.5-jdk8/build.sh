set -eo pipefail
tagVersion=3.8.5-jdk8
docker build -t wuzhaozhongguo/build-maven:${tagVersion} .
docker push wuzhaozhongguo/build-maven:${tagVersion}

docker tag wuzhaozhongguo/build-maven:${tagVersion} registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-maven:${tagVersion}
docker push registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-maven:${tagVersion}