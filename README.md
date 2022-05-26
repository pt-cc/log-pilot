# log-pilot-filebeat

## Overview

For k3s,elk。发现个奇怪的问题，使用filebeat-6.1.1不能创建自定义的索引。使用filebeat-6.1.1-3就没有问题。

## Get started

### docker version
```buildoutcfg
docker build -t log-pilot-filebeat:docker -f Dockerfile.docker .

docker run -d \
   --name log-pilot-filebeat \
   -v /var/run/docker.sock:/var/run/docker.sock \
   -v /etc/localtime:/etc/localtime \
   -v /:/host:ro \
   --cap-add SYS_ADMIN \
   -e LOGGING_OUTPUT=elasticsearch \
   -e ELASTICSEARCH_HOSTS=es_host:9200 \
   --restart=always \
   log-pilot-filebeat:docker
```

### contianerd version
```buildoutcfg
docker build -t log-pilot-filebeat:containerd -f Dockerfile.containerd .

docker run -d \
   --name log-pilot-filebeat \
   -v /run/k3s/containerd/containerd.sock:/var/run/containerd/containerd.sock \
   -v /etc/localtime:/etc/localtime \
   -v /:/host:ro \
   --cap-add SYS_ADMIN \
   -e LOGGING_OUTPUT=elasticsearch \
   -e ELASTICSEARCH_HOSTS=es_host:9200 \
   --restart=always \
   log-pilot-filebeat:containerd
```


## Contributing

Thanks for [Wei Shuyu](https://github.com/wsy2220/log-pilot/tree/containerd) and [WilliamGuozi](https://github.com/WilliamGuozi/log-pilot-filebeat) and [AliyunContainerService](https://github.com/AliyunContainerService/log-pilot)!
