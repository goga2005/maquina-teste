#!/bin/bash
sudo apt-get update
sudo apt-get upgrade --yes

sudo apt-get install curl vim --yes

echo "172.31.255.100 traefik-k3s-dev.al.mt.gov.br" >> /etc/hosts
echo "172.31.255.100 teleport-k3s-dev.al.mt.gov.br" >> /etc/hosts
echo "172.31.255.100 *.teleport-k3s-dev.al.mt.gov.br" >> /etc/hosts
echo "172.31.255.100 mariadb-k3s-dev.al.mt.gov.br" >> /etc/hosts
echo "172.31.255.100 nginx-k3s-dev.al.mt.gov.br" >> /etc/hosts