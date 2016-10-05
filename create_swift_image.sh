#!/bin/bash

if [ $1 != "--partial" ]
then
    docker build -t quay.io/syncano/swift-codebox .
fi

docker run -d -p 2200:22 --env-file image/environment --name ansible quay.io/syncano/swift-codebox dumb-init /usr/sbin/sshd -D
ansible-playbook -i "`docker inspect --format '{{ .NetworkSettings.IPAddress }}' ansible`," -u root --private-key image/id_rsa provision-swift-codebox.yml

docker commit ansible quay.io/syncano/swift-codebox

docker run -d --env-file image/environment -u syncano --name swift quay.io/syncano/swift-codebox dumb-init /usr/sbin/sshd -D
docker commit swift quay.io/syncano/swift-codebox
