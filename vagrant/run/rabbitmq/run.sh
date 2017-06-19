#! /bin/bash

set -e

mkdir -p images

docker save -o images/rabbitmq.tar.gz valfadeev/rabbitmq

vagrant up
