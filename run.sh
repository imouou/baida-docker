#!/bin/sh
## 持久化数据存储，把项目挂载到当前目录中
docker run -it --env-file env.list -p 8000:8000 -p 8001:8001 -d --name=baida -v ./Baida:/home/Baida --privileged=true easybui/baida:latest