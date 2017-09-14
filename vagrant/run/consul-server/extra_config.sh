#! /bin/bash

set -e

ip_addr=$(ip addr show eth1 \
        | grep inet \
        | head -1 \
        | awk '{ print $2; }' \
        | cut -f 1 -d\/)

host=$(hostname -s)

expect="$1"

shift

join="$1"

printf "{\"node_name\": \"${host}\", \
         \"advertise_addr\": \"${ip_addr}\", \
         \"bootstrap_expect\": ${expect}, \
         \"retry_join\": ${join}, \
         \"enable_script_checks\": true \
        }" \
        > /etc/consul/config/extra_config.json

docker start consul
