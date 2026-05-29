#!/bin/bash

APP_URL="https://artemmanko.duckdns.org"
ARGOCD_URL="https://argocd.artemmanko.duckdns.org"

echo "=============================="
echo "1. Kubernetes nodes"
echo "=============================="
kubectl get nodes -o wide

echo
echo "=============================="
echo "2. Kubernetes namespaces"
echo "=============================="
kubectl get ns

echo
echo "=============================="
echo "3. All pods in cluster"
echo "=============================="
kubectl get pods -A

echo
echo "=============================="
echo "4. NGINX Ingress Controller"
echo "=============================="
kubectl get svc -n kube-system | grep ingress-nginx || true
kubectl get pods -n kube-system | grep ingress-nginx || true

echo
echo "=============================="
echo "5. Application resources"
echo "=============================="
kubectl get deployment,svc,ingress,pod -n default

echo
echo "=============================="
echo "6. ArgoCD status"
echo "=============================="
kubectl get app -n argocd

echo
echo "=============================="
echo "7. ArgoCD pods"
echo "=============================="
kubectl get pods -n argocd

echo
echo "=============================="
echo "8. cert-manager status"
echo "=============================="
kubectl get pods -n cert-manager
kubectl get clusterissuer

echo
echo "=============================="
echo "9. TLS certificates"
echo "=============================="
kubectl get certificate -A

echo
echo "=============================="
echo "10. HTTPS application check"
echo "=============================="
curl -I $APP_URL

echo
echo "=============================="
echo "11. HTTPS ArgoCD check"
echo "=============================="
curl -I $ARGOCD_URL

echo
echo "=============================="
echo "12. Application response"
echo "=============================="
curl $APP_URL

echo
echo
echo "=============================="
echo "13. Docker image used by deployment"
echo "=============================="
kubectl get deployment python-backend -o jsonpath='{.spec.template.spec.containers[0].image}'
echo

echo
echo "=============================="
echo "Defense check completed"
echo "=============================="
```
