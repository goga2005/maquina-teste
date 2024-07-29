#!/bin/bash
sudo apt-get update
sudo apt-get upgrade --yes

sudo apt-get install curl vim gnupg --yes

# Add repository
sudo curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor
sudo echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bookworm/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list

# install mongodb
sudo apt-get update --yes
sudo apt-get install mongodb-org --yes

# Ativa serviço para subir automatico quando reiniciar maquina
sudo systemctl enable mongod

# Copia certificado al.mt.gov.br
sudo mkdir -p /etc/ssl/al.mt.gov.br/
sudo cp /vagrant/config/ca-chain-commercial-key.pem /etc/ssl/al.mt.gov.br/ca-chain-commercial-key.pem
sudo chown mongodb:root ca-chain-commercial-key.pem
sudo chmod 640 ca-chain-commercial-key.pem

# Copia arquivo de configuração do mongo.
sudo cat /vagrant/config/mongod.conf > /etc/mongod.conf

sudo systemctl start mongod

# echo "172.31.255.100 traefik-k3s-dev.al.mt.gov.br" >> /etc/hosts
# echo "172.31.255.100 teleport-k3s-dev.al.mt.gov.br" >> /etc/hosts
# echo "172.31.255.100 *.teleport-k3s-dev.al.mt.gov.br" >> /etc/hosts
# echo "172.31.255.100 mariadb-k3s-dev.al.mt.gov.br" >> /etc/hosts
# echo "172.31.255.100 nginx-k3s-dev.al.mt.gov.br" >> /etc/hosts