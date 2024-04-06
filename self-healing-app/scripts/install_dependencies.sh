#!/bin/bash

# Ensure the script is run as root
if [ "$(id -u)" -ne 0 ]; then
  echo "This script must be run as root" 1>&2
  exit 1
fi

echo "Starting installation of dependencies..."

# Update package lists
echo "Updating package lists..."
apt-get update

# Install Curl and other utilities if not already present
echo "Installing Curl, apt-transport-https, and other necessary tools..."
apt-get install -y curl apt-transport-https ca-certificates software-properties-common

# Install kubectl
echo "Installing kubectl..."
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update && apt-get install -y kubectl

# Install Helm
echo "Installing Helm..."
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

echo "Installation of dependencies completed successfully."
