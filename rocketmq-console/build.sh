#!/usr/bin/env bash

#docker rmi styletang/rocketmq-console-ng:latest
docker rmi registry.cn-qingdao.aliyuncs.com/nluohe/rocketmq-console:latest
mvn clean package -Dmaven.test.skip=true docker:build
docker tag styletang/rocketmq-console-ng:latest registry.cn-qingdao.aliyuncs.com/nluohe/rocketmq-console:latest
expect -c "
   spawn docker login --username=桔灯行网络科技 registry.cn-qingdao.aliyuncs.com
   expect {
    \"*assword\" {set timeout 300; send \"jdx@123!@#\r\";}
    \"yes/no\" {send \"yes\r\"; exp_continue;}
  }
  expect eof"
# 推送镜像
docker push registry.cn-qingdao.aliyuncs.com/nluohe/rocketmq-console:latest

# 运行镜像
#docker run -e 'JAVA_OPTS=-Drocketmq.namesrv.addr=192.168.0.110:9876;192.168.0.116:9876 -Dcom.rocketmq.sendMessageWithVIPChannel=false'\
# --restart always -p 8989:8080 -d \
## -v ${pwd}/data:/tmp/rocketmq-console/data \
# --name rocketmq-console registry.cn-qingdao.aliyuncs.com/nluohe/rocketmq-console:latest
