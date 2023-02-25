variable "resource_group_name" {
  default = "cp2-resources"
}

variable "location_name" {
  default = "EastUS2"
}

variable "network_name" {
  default = "cp2-vnet"
}

variable "subnet_name" {
  default = "cp2-subnet1"
}

variable "public_ip" {
  default = "cp2-pubip"
}
variable "vm_nic" {
  default = "cp2-nic"
}

variable "vm_name" {
  default = "cp2-webserver"
}