sudo cd /opt

sudo wget https://github.com/prometheus/node_exporter/releases/download/v1.9.1/node_exporter-1.9.1.linux-amd64.tar.gz

sudo tar xf node_exporter-1.9.1.linux-amd64.tar.gz

sudo mv node_exporter-1.9.1.linux-amd64.tar.gz node_exporter

sudo cd node_exporter

sudo ./node_exporter 

