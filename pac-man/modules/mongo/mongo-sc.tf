resource "kubernetes_storage_class" "mongo_sc" {
  metadata {
    name = "mongo-sc"

    annotations = {
      "storageclass.kubernetes.io/is-default-class" = "true"
    }
  }
  
  storage_provisioner = "kubernetes.io/azure-disk"
  reclaim_policy      = "Retain"
  parameters = {
    storageaccounttype = "Premium_LRS"
    kind              = "Managed"
    cachingmode       = "ReadWrite"
    replicationtype   = "ZoneRedundant"
  }
}

