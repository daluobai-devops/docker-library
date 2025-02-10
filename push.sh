#!/bin/bash
set -eo pipefail
imageName=schnitzler/mysqldump
targetImageName=schnitzler-mysqldump
tagVersion=latest
#platformParam='--platform linux/arm64/v8'
#docker pull "${platformParam}" ${imageName}:${tagVersion}
docker pull ${imageName}:${tagVersion}

docker tag ${imageName}:${tagVersion} registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/${targetImageName}:${tagVersion}
docker push registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/${targetImageName}:${tagVersion}