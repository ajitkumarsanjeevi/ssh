#!/bin/bash

node_exporter="/opt/node_exporter"

# Check if the directory exists
if [ -d "$node_exporter" ]; then
  echo "Prometheus directory exists at $node_exporter"
else
cd /opt

sudo apt install wget -y

sudo wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz

sudo tar xf node_exporter-1.9.1.linux-amd64.tar.gz

sudo mv node_exporter-1.9.1.linux-amd64 node_exporter

cd node_exporter

./node_exporter

fi
