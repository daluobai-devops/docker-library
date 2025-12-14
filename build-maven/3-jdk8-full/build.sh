#!/bin/bash
set -e
tagVersion=3-jdk8-full

PLATFORM="linux/amd64,linux/arm64"
docker buildx build --platform ${PLATFORM} \
  -t wuzhaozhongguo/build-maven:${tagVersion} \
  -t registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-maven:${tagVersion} \
  --push .