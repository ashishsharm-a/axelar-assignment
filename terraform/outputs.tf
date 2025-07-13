
output "namespace" {
  value = kubernetes_namespace.axelar.metadata[0].name
}
