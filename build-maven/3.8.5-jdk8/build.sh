set -eo pipefail
docker build -t wuzhaozhongguo/build-maven:3.8.5-jdk8 .
docker push wuzhaozhongguo/build-maven:3.8.5-jdk8