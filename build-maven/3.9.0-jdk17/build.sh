set -eo pipefail
docker build -t wuzhaozhongguo/build-maven:3.9.0-jdk17 .
docker push wuzhaozhongguo/build-maven:3.9.0-jdk17