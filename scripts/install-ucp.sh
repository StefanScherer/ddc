#!/bin/bash
echo Pull the latest version of UCP
docker pull docker/ucp:2.1.0-beta2

echo Install UCP
docker run --rm --name ucp \
  -v /var/run/docker.sock:/var/run/docker.sock \
  docker/ucp:2.1.0-beta2 install \
  --debug \
  --host-address 192.168.32.2 \
  --admin-username admin \
  --admin-password administrator \
  --license $(cat /vagrant/license/ddc-license.lic)
