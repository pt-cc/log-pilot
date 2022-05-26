#!/usr/bin/env bash
#
# build docker image
#

build()
{
    echo -e "building image: log-pilot:latest\n"
    docker build -t log-pilot-filebeat:containerd -f Dockerfile.$1 .
#    docker push log-pilot-filebeat:containerd
}

case $1 in
fluentd)
    build fluentd
    ;;
*)
    build filebeat
    ;;
esac
