# Final Project - Kubernetes GitOps Platform

## Project Overview

This project demonstrates a complete DevOps workflow using Terraform, AWS EKS, Docker, GitHub Actions, ArgoCD, NGINX Ingress Controller, cert-manager and Let's Encrypt.

The application is automatically built, published and deployed to Kubernetes using GitOps principles.

---

# Architecture

```text
Developer
    │
    ▼
GitHub Repository
    │
    ▼
GitHub Actions
    │
    ▼
Docker Hub
    │
    ▼
ArgoCD
    │
    ▼
Amazon EKS
    │
    ▼
NGINX Ingress Controller
    │
    ▼
DuckDNS + Let's Encrypt
    │
    ▼
Users
```

---

# Technologies Used

* AWS EKS
* Terraform
* Kubernetes
* Docker
* Docker Hub
* GitHub Actions
* ArgoCD
* NGINX Ingress Controller
* cert-manager
* Let's Encrypt
* DuckDNS
* Python Flask

---

# Infrastructure

Infrastructure is provisioned using Terraform.

Created resources:

* VPC
* Security Groups
* IAM Roles
* EKS Cluster
* EKS Node Group
* NGINX Ingress Controller
* ArgoCD

Terraform code is located in:

```text
terraform/EKS/
```

---

# Application

Simple Python Flask application.

Response example:

```text
OK
```

Application source code:

```text
app/main.py
```

---

# Containerization

Docker image is built using:

```text
Dockerfile
```

Build example:

```bash
docker build -t username/python-backend .
```

Run example:

```bash
docker run -p 8080:8080 username/python-backend
```

---

# CI/CD Pipeline

GitHub Actions pipeline performs:

1. Source code checkout
2. Docker image build
3. Docker Hub login
4. Docker image push

Pipeline file:

```text
.github/workflows/docker-build.yml
```

---

# GitOps Deployment

Deployment is managed by ArgoCD.

ArgoCD continuously monitors:

```text
k8s/
```

and synchronizes Kubernetes resources automatically.

Application manifest:

```text
argocd/application.yaml
```

---

# Kubernetes Resources

Project contains:

### Deployment

```text
k8s/deployment.yaml
```

### Service

```text
k8s/service.yaml
```

### Ingress

```text
k8s/ingress.yaml
```

---

# HTTPS Configuration

HTTPS is configured using:

* cert-manager
* Let's Encrypt ClusterIssuer

Certificate is automatically issued and renewed.

ClusterIssuer:

```text
cert-manager/clusterissuer.yaml
```

---

# Public URLs

### Application

```text
https://artemmanko.duckdns.org
```

### ArgoCD

```text
https://argocd.artemmanko.duckdns.org
```

---

# Verification Commands

Check nodes:

```bash
kubectl get nodes
```

Check pods:

```bash
kubectl get pods -A
```

Check ingress:

```bash
kubectl get ingress
```

Check certificates:

```bash
kubectl get certificate
```

Check ArgoCD applications:

```bash
kubectl get app -n argocd
```

---

# Results

Successfully implemented:

* Infrastructure as Code using Terraform
* Managed Kubernetes cluster in AWS EKS
* Containerized application
* CI pipeline with GitHub Actions
* GitOps deployment with ArgoCD
* NGINX Ingress Controller
* Automatic HTTPS certificates with Let's Encrypt
* Public DNS using DuckDNS
* Automated application delivery

---

# Author

Artem Manko


DevOps Engineering Course Final Project
