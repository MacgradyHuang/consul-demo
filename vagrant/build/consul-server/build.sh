#! /bin/bash

set -e

mkdir -p images

docker save -o images/consul.tar.gz valfadeev/consul
../../../scripts/build.sh ValFadeev/consul-server
