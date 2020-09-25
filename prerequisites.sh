#!/bin/bash
sudo yum install git docker -y
sudo curl -L https://github.com/docker/compose/releases/download/1.27.4/docker-compose-`uname -s`-`uname -m` -o /usr/bin/docker-compose
sudo systemctl start docker
sudo systemctl enable docker
