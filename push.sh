#!/bin/bash
set -eo pipefail
imageName=consul
tagVersion=1.10.3
platformParam='--platform linux/arm64/v8'
docker pull "${platformParam}" ${imageName}:${tagVersion}

docker tag ${imageName}:${tagVersion} registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/${imageName}:${tagVersion}
docker push registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/${imageName}:${tagVersion}