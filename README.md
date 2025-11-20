# Demo: CI/CD Pipeline for Kubernetes on Azure (AKS) with GitHub Actions

This demo project shows how to build, push, and deploy a Node.js app with Docker and Kubernetes on Azure Kubernetes Service (AKS). The pipeline uses GitHub Actions.

## Structure

```
app/                  # Node.js sample app
Dockerfile            # Container definition
k8s/                  # Kubernetes manifests (deployment, service)
.github/workflows/    # CI/CD workflow
README.md             # This guide
```

## Prerequisites

- Azure subscription
- [Azure Container Registry (ACR)](https://learn.microsoft.com/en-us/azure/container-registry/)
- [Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/)
- Service Principal with access to ACR and AKS ([Guide](https://learn.microsoft.com/en-us/azure/developer/github/connect-to-azure?tabs=azure-portal%2Clinux))
- [kubectl installed](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

## Setup

### 1. Create required Azure resources

- Create an [ACR](https://learn.microsoft.com/en-us/azure/container-registry/container-registry-get-started-portal)
- Create an [AKS](https://learn.microsoft.com/en-us/azure/aks/kubernetes-walkthrough-portal)

### 2. Update `k8s/deployment.yaml`

Replace `<ACR_NAME>` with your Azure Container Registry name.

### 3. Add GitHub Secrets

- `AZURE_CREDENTIALS` – JSON credentials from your Azure service principal. ([docs](https://learn.microsoft.com/en-us/azure/developer/github/connect-to-azure?tabs=azure-portal%2Clinux#create-an-azure-service-principal))
- `AZURE_CONTAINER_REGISTRY` – Your ACR name.
- `AKS_RESOURCE_GROUP` – Resource group name for AKS.
- `AKS_CLUSTER_NAME` – Your AKS cluster name.

Go to your repository → Settings → Secrets → Actions → New repository secret.

### 4. Push to GitHub

Commit and push your code. On every push to main, the workflow will build and push your Docker image to ACR, then deploy/update your Kubernetes app on AKS.

## Quick Start

1. Clone this repo and follow the steps above.
2. Commit & push to the `main` branch.
3. Monitor workflow in GitHub Actions tab.

## Sample access

After successful deployment, get the public IP of your AKS service:

```bash
kubectl get service demo-app-service
```

Visit that IP in your browser.

---

Want to customize for other languages or add Helm/Kustomize? Let me know!