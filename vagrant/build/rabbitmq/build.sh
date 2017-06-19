#! /bin/bash

set -e

mkdir -p images

docker save -o images/consul.tar.gz valfadeev/consul
docker save -o images/rabbitmq.tar.gz valfadeev/rabbitmq

../../../scripts/build.sh ValFadeev/rabbitmq
