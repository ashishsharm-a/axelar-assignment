
provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "axelar" {
  metadata {
    name = "axelar"
  }
}

resource "kubernetes_persistent_volume" "axelar_data" {
  metadata {
    name = "axelar-data-pv"
  }
  spec {
    capacity = {
      storage = "500Gi"
    }
    access_modes = ["ReadWriteOnce"]
    persistent_volume_source {
      host_path {
        path = "/mnt/data/axelar-data"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "axelar_data_claim" {
  metadata {
    name      = "axelar-data-pvc"
    namespace = kubernetes_namespace.axelar.metadata[0].name
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "500Gi"
      }
    }
  }
}
