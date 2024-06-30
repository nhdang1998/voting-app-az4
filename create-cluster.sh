#!/bin/bash

# Variables
resourceGroup="acdnd-az4-project"
clusterName="udacity-cluster"

# Install aks cli
echo "Installing AKS CLI"

sudo az aks install-cli

echo "AKS CLI installed"

# Create AKS cluster
echo "Step 1 - Creating AKS cluster $clusterName"
# Use either one of the "az aks create" commands below
# For users working in their personal Azure account
# This commmand will not work for the Cloud Lab users, because you are not allowed to create Log Analytics workspace for monitoring
az aks create \
--resource-group $resourceGroup \
--name $clusterName \
--node-count 1 \
--enable-addons monitoring \
--generate-ssh-keys

echo "AKS cluster created: $clusterName"

# Connect to AKS cluster

echo "Step 2 - Getting AKS credentials"

az aks get-credentials \
--resource-group $resourceGroup \
--name $clusterName \
--verbose

echo "Verifying connection to $clusterName"

kubectl get nodes

# echo "Deploying to AKS cluster"
# The command below will deploy a standard application to your AKS cluster. 
# kubectl apply -f azure-vote.yaml
