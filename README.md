# docker-library
docker 镜像
# 文档

os - > centos7
-  使用
```bash
docker run -it --name="test-centos7" --privileged=true --volume=D:\workspace\code\github\wuzhaozhongguo\test\:/volume registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/centos:7
docker run -it --name="test-node10" --privileged=true  --volume=D:\workspace\docker\volume\test-node14:/volume registry.cn-hangzhou.aliyuncs.com/wuzhaozhongguo/build-npm:10.16.0
```