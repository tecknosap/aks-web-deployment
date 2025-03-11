# MyWebsite Deployment on Azure Kubernetes Service (AKS)

This project demonstrates how to deploy a simple static website using Azure Kubernetes Service (AKS) and Azure Container Registry (ACR). The website is served using Nginx, and the application is exposed via a LoadBalancer service.

## Overview

The project involves deploying a Dockerized Nginx server in a Kubernetes cluster on Azure. The Nginx server serves a static HTML page that can be accessed publicly. The entire infrastructure, including Azure Kubernetes Service (AKS) and Azure Container Registry (ACR), is managed with Terraform for easy provisioning and management.

### Key Components:
- **Azure Kubernetes Service (AKS)**: A managed Kubernetes service to run the application in a scalable way.
- **Azure Container Registry (ACR)**: Stores the Docker image for the website.
- **Nginx**: A lightweight web server used to serve the static content (HTML file).
- **LoadBalancer Service**: Exposes the application to the internet with a public IP.

## Project Structure

1. **Infrastructure as Code (Terraform)**
   - Terraform is used to provision the required Azure resources, including:
     - Resource Group
     - Azure Container Registry (ACR)
     - Azure Kubernetes Service (AKS)

2. **Dockerfile**
   - The Dockerfile defines the container image based on the official Nginx image, and it copies the static HTML content into the container.

3. **Kubernetes Manifests**
   - **Deployment**: Defines the deployment of the Nginx container with two replicas for high availability.
   - **Service**: Exposes the application using a LoadBalancer to allow external traffic to reach the application.

## Prerequisites

To get started with this project, you’ll need:

1. **Azure Account**: Make sure you have an active Azure subscription.
2. **Azure CLI**: Installed and configured with your Azure account.
3. **Terraform**: Installed to provision the Azure infrastructure.
4. **kubectl**: Installed to manage the Kubernetes cluster.
5. **Docker**: Installed to build and push the container image.


#### Tecknosap website

<img src="https://github.com/tecknosap/aks-web-deployment/blob/main/Animation-web.gif?raw=true" alt="Website Deployment Animation" width="600" height="300" />

## Setup and Usage

### Step 1: Provision Resources with Terraform

1. Clone this repository and navigate to the project directory:
   ```bash
   git clone https://github.com/yourusername/mywebsite-aks.git
   cd mywebsite-aks

Initialize Terraform to download the required providers:
terraform init

Apply the Terraform configuration to create the resources in Azure:
terraform apply
Terraform will prompt for confirmation to create the resources. Type yes to proceed.

#### Step 2: Build and Push the Docker Image

Build the Docker image for the website:

docker build -t tecknosap.azurecr.io/mywebsite:v1 .

#### Authenticate Docker to Azure Container Registry:

az acr login --name tecknosap

#### Push the Docker image to your ACR:

docker push tecknosap.azurecr.io/mywebsite:v1

#### Step 3: Deploy to AKS
Configure kubectl to use the newly created AKS cluster:

az aks get-credentials --resource-group my-aks-rg --name my-aks-cluster

#### Apply the Kubernetes manifests to deploy the website:

kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

#### Step 4: Access the Website
After deployment, the application will be exposed using a LoadBalancer. You can check the external IP address of the service:

kubectl get svc mywebsite-service
Once the external IP is available, you can access the website by navigating to the URL in your browser.

#### Step 5: Clean Up
To clean up and remove the resources:

##### Destroy the Terraform-managed infrastructure:
terraform destroy
Optionally, clean up the Azure resources manually if needed.

##### License
This project is licensed under the MIT License - see the LICENSE file for details.

##### Conclusion
This project demonstrates the integration of multiple Azure services, including AKS, ACR, and Terraform for infrastructure management. It provides a simple yet effective way to deploy a web application in a Kubernetes environment and expose it using a LoadBalancer.
