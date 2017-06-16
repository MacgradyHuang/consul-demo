#! /bin/bash

set -e

mkdir -p images

docker save -o images/consul.tar.gz valfadeev/consul
docker save -o images/frontend.tar.gz valfadeev/consul-example-frontend
docker save -o images/backend.tar.gz valfadeev/consul-example-backend

../../../scripts/build.sh ValFadeev/consul-client
