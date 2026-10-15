output "resource_group_name" {
  description = "The name of the Azure Resource Group hosting the Static Web App."
  value       = azurerm_resource_group.this.name
}

output "static_web_app_name" {
  description = "The name of the Azure Static Web App instance."
  value       = module.static_web_app.name
}

output "static_web_app_default_host_name" {
  description = "The default hostname (.azurestaticapps.net) of the deployed Static Web App."
  value       = module.static_web_app.resource_uri
}

output "static_web_app_api_key" {
  description = "The deployment token / API key required for Azure Static Web Apps GitHub Actions deployment workflow."
  value       = module.static_web_app.api_key
  sensitive   = true
}
