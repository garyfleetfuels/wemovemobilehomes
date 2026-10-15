resource "azurerm_resource_group" "this" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "static_web_app" {
  source  = "Azure/avm-res-web-staticsite/azurerm"
  version = "~> 0.6.0"

  name                = var.static_web_app_name
  resource_group_name = azurerm_resource_group.this.name
  location            = azurerm_resource_group.this.location
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
  tags                = var.tags
}
