#!/usr/bin/env bash

# set -xeuo pipefail

Y=$(date +%Y)
M=$(date +%m)
T=$(date +%Y%m%d)

for idx in txt yaml
do
    url="https://clashnode.com/wp-content/uploads/$Y/${M}/${T}.${idx}"
    http_code=$(curl -w "%{http_code}\n" -o /dev/null -s ${url})
    if [ "${http_code}" == "200" ]; then
        wget -q ${url} -O latest.${idx}
    else
        echo "访问 ${url} 失败, ${http_code}"
    fi
done
