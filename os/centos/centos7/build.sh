#!/bin/bash
set -eo pipefail
tagVersion=7
docker build -t wuzhaozhongguo/centos:${tagVersion} .
docker push wuzhaozhongguo/centos:${tagVersion}

docker tag wuzhaozhongguo/centos:${tagVersion} registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/centos:${tagVersion}
docker push registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/centos:${tagVersion}