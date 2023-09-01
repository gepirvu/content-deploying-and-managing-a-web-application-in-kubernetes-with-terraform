provider "azurerm" {
  subscription_id = "..."
  client_id       = var.appId
  client_secret   = var.password
  tenant_id       = "..."
  features {}
  skip_provider_registration = "true"
}

## Import Resource Group Before Apply ##
resource "azurerm_resource_group" "kube_rg" {
  name     = "gp_kubernetes"
  location = "westeu"

  tags = {
    environment = "Demo"
  }
}

resource "azurerm_kubernetes_cluster" "kube_cluster" {
  name                = "gp-k8s"
  location            = azurerm_resource_group.kube_rg.location
  resource_group_name = azurerm_resource_group.kube_rg.name
  dns_prefix          = "gp-k8s"

  default_node_pool {
    name            = "gp-k8s-nodepool"
    node_count      = 2
    vm_size         = "Standard_B2s"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control {
    enabled = true
  }

  tags = {
    environment = "Demo"
  }
}
