#!/bin/bash
set -e
tagVersion=7

PLATFORM="linux/amd64"

docker buildx build --platform ${PLATFORM} \
  -t wuzhaozhongguo/centos:${tagVersion} \
  -t registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/centos:${tagVersion} \
  --push .