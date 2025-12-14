#!/bin/bash
set -e
tagVersion=jdk11-node168

PLATFORM="linux/amd64"
docker buildx build --platform ${PLATFORM} \
  -t wuzhaozhongguo/build-mix:${tagVersion} \
  -t registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-mix:${tagVersion} \
  --push .
