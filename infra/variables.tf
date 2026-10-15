variable "environment" {
  type        = string
  description = "Target deployment environment identifier (e.g. dev, staging, prod)."
  default     = "prod"
}

variable "location" {
  type        = string
  description = "Azure region for resources. For Azure Static Web Apps, westeurope is the standard control-plane location for UK and Europe deployments."
  default     = "westeurope"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group housing the Static Web App and related infrastructure."
  default     = "rg-wmmh-prod"
}

variable "static_web_app_name" {
  type        = string
  description = "Name of the Azure Static Web App instance."
  default     = "stapp-wmmh-prod"
}

variable "sku_tier" {
  type        = string
  description = "SKU tier of the Azure Static Web App. Accepted values: Free, Standard."
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_tier)
    error_message = "The sku_tier value must be either 'Free' or 'Standard'."
  }
}

variable "sku_size" {
  type        = string
  description = "SKU size of the Azure Static Web App. Accepted values: Free, Standard."
  default     = "Free"

  validation {
    condition     = contains(["Free", "Standard"], var.sku_size)
    error_message = "The sku_size value must be either 'Free' or 'Standard'."
  }
}

variable "tags" {
  type        = map(string)
  description = "Resource tags applied across all deployed Azure resources for governance and cost tracking."
  default = {
    Project     = "We Move Mobile Homes"
    Environment = "Production"
    ManagedBy   = "Terraform"
  }
}
