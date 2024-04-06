#!/bin/bash

# Check if Minikube is installed
if ! command -v minikube &> /dev/null
then
    echo "Minikube could not be found. Please install Minikube and try again."
    exit
fi

# Start Minikube
echo "Starting Minikube..."
minikube start --driver=virtualbox

# Enable addons
echo "Enabling Minikube addons: metrics-server, ingress"
minikube addons enable metrics-server
minikube addons enable ingress

echo "Minikube is set up and running."
