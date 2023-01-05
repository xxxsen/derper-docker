#!/bin/bash

latest=$(curl https://github.com/tailscale/tailscale/releases 2>&1 | grep tailscale  |grep "/tailscale/tailscale/tree" | head -n 1 | awk -F "\"" '{print $2}' | awk -F"/" '{print $5}')

echo "read latest version:$latest"

docker build --build-arg VER=$latest -t xxxsen/derper:$latest -t xxxsen/derper:latest .

docker push xxxsen/derper:$latest
docker push xxxsen/derper:latest


