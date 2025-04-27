# Set your Prometheus directory path
PROMETHEUS_DIR="/opt/prometheus"

# Check if the directory exists
if [ -d "$PROMETHEUS_DIR" ]; then
  echo "Prometheus directory exists at $PROMETHEUS_DIR"
else
  
cd /opt

sudo apt install wget -y

sudo wget https://github.com/prometheus/prometheus/releases/download/v3.3.0/prometheus-3.3.0.linux-amd64.tar.gz

sudo tar xf prometheus-3.3.0.linux-amd64.tar.gz 

sudo mv  prometheus-3.3.0.linux-amd64 prometehus

fi

