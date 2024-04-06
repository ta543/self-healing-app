#!/bin/bash

# Check if Minikube is installed
if ! command -v minikube &> /dev/null
then
    echo "Minikube could not be found. Please install Minikube and try again."
    exit
fi

# Stop and delete Minikube cluster
echo "Stopping Minikube..."
minikube stop
echo "Deleting Minikube cluster..."
minikube delete

echo "Minikube cluster has been successfully deleted."
