variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "location_name" {
  type        = string
  description = "Localizacion de los recursos"
}

variable "network_name" {
  type        = string
  description = "Nombre de la red"
}

variable "subnet_name" {
  type        = string
  description = "Nombre de la subred"
}

variable "public_ip" {
  type        = string
  description = "Nombre de la IP pública"
}

variable "vm_nic" {
  type        = string
  description = "Nombre de la interfaz de red"
}

variable "vm_name" {
  type        = string
  description = "Nombre de la máquina virtual de webserver"
}

variable "vm_user" {
  type        = string
  description = "Nombre administrador y usuario de webserver"
}

variable "vm_size" {
  type = string
  description = "Tipo/tamaño de la máquina virtual webserver"
}

variable "public_key_path" {
  type = string
  description = "Path a la clave pueblica de acceso al webserver"
}

variable "container_registry" {
  type        = string
  description = "Nombre del servidor de registro de contenedores"
}

 variable "aks_cluster_name" {
  type        = string
  description = "Nombre del cluster AKS"
 }

variable "aks_kubernetes_version" {
  type        = string
  description = "Versión de Kubernetes"
  }

variable "aks_workers_count" {
  type        = number
  description = "Número de workers del cluster AKS"
}

variable "aks_workers_type" {
  type        = string
  description = "Tipo/tamaño de workers del cluster AKS"
}

variable "aks_kubeconfig_path" {
  type        = string
  description = "kubeconfig con el acceso al cluster de AKS"
}



