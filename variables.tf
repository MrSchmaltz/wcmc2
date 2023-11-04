variable "resource_group_name" {
  description = "Name for resource group"
  type        = string
  default     = "Devops-interview"
}

variable "resource_group_location" {
  description = "Azure region"
  type        = string
  default     = "uksouth"
}
variable "tags" {
  description = "resource tags"
  type        = map(any)
  default     = {}
}

variable "storage_account_name" {
  description = "Name of storage accounts"
  type        = string
  default     = "devops-interview-storage"
}

variable "function_app_name" {
  description = "Name of function app"
  type        = string
  default     = "devops-interview-staging"
}
variable "app_service_plan_name" {
  type    = string
  description = "Name for the App Service Plan"
}
