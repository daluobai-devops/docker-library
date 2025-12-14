#!/bin/bash
set -e
tagVersion=16

PLATFORM="linux/amd64,linux/arm64"

docker buildx build --platform ${PLATFORM} \
  -t wuzhaozhongguo/build-npm:${tagVersion} \
  -t registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-npm:${tagVersion} \
  --push .