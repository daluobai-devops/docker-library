set -eo pipefail
tagVersion=jdk8-node10160
docker build -t wuzhaozhongguo/build-mix:${tagVersion} .
docker push wuzhaozhongguo/build-mix:${tagVersion}

docker tag wuzhaozhongguo/build-mix:${tagVersion} registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-mix:${tagVersion}
docker push registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-mix:${tagVersion}