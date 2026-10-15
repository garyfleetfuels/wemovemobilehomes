variable "environment" {
  type        = string
  description = "Target deployment environment identifier (e.g. dev, staging, prod)."
  default     = "prod"
}

variable "location" {
  type        = string
  description = "Azure region for the Resource Group."
  default     = "westeurope"
}

variable "static_web_app_location" {
  type        = string
  description = "Azure region for the Static Web App control plane. Note: SWA distributes static assets globally across Microsoft edge PoPs; this specifies the management control plane. Defaults to 'eastus2' due to West Europe regional capacity restrictions."
  default     = "eastus2"
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
