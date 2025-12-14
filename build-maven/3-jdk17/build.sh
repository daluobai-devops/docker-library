#!/bin/bash
set -e
tagVersion=3-jdk17

# 指定要构建的架构，可以是 linux/amd64, linux/arm64, linux/arm/v7 等
# 默认构建 amd64 和 arm64 两种架构
PLATFORM="linux/amd64,linux/arm64"

# 如果只需要构建单个架构，可以取消下面某一行的注释
# PLATFORM="linux/amd64"  # 仅 amd64
# PLATFORM="linux/arm64"  # 仅 arm64

# 使用 buildx 构建多架构镜像
docker buildx build --platform ${PLATFORM} \
  -t wuzhaozhongguo/build-maven:${tagVersion} \
  -t registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-maven:${tagVersion} \
  --push .