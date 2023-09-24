resource "azurerm_kubernetes_cluster" "thor-aks_cluster" {
  name                = "thor-aks_cluster"
  location            = azurerm_resource_group.thor-rg.location
  resource_group_name = azurerm_resource_group.thor-rg.name
  dns_prefix          = "thor-aks-cluster"

  default_node_pool {
    name       = "aks"
    node_count = 2
    vm_size    = "Standard_D2_v4"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.thor-aks_cluster.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.thor-aks_cluster.kube_config_raw
  sensitive = true
}