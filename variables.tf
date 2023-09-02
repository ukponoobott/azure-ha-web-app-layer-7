variable "workload" {
  type        = string
  description = "(Required) The workload of the resource created."
  default     = "demo"
}

variable "environment" {
  type        = string
  description = "(Required) The environment in which the resources are been created."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "(Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  default     = "eastus2"
}