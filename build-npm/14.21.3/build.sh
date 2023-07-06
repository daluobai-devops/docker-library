#!/bin/bash
set -eo pipefail
tagVersion=14.21.3
docker build -t wuzhaozhongguo/build-npm:${tagVersion} .
docker push wuzhaozhongguo/build-npm:${tagVersion}

docker tag wuzhaozhongguo/build-npm:${tagVersion} registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-npm:${tagVersion}
docker push registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-npm:${tagVersion}