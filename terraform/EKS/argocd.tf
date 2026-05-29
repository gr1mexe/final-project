resource "helm_release" "argocd" {
  name             = "argocd"
  namespace        = "argocd"
  create_namespace = true

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  values = [
    yamlencode({
      configs = {
        params = {
          "server.insecure" = true
        }
      }

      server = {
        ingress = {
          enabled          = true
          ingressClassName = "nginx"
          hostname         = "argocd.artemmanko.duckdns.org"
          path             = "/"
          pathType         = "Prefix"
        }
      }
    })
  ]

  depends_on = [
    helm_release.nginx_ingress
  ]
}