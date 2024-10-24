# terraform-azurerm-redis

Magicorn made Terraform Module for Azure Provider
--
```
module "redis-master" {
  source      = "magicorntech/redis/azurerm"
  version     = "0.0.1"
  tenant      = var.tenant
  name        = var.name
  environment = var.environment
  rg_name     = azurerm_resource_group.main.name
  rg_location = azurerm_resource_group.main.location
  prv_dns_id  = "/subscriptions/12345678-1234-1234-1234-123456789abc/resourceGroups/magicorn-main-rg-bastion/providers/Microsoft.Network/privateDnsZones/magicorn.postgres.database.azure.com"
  subnet_id   = module.network.pvt_subnet_ids[0]

  # Redis Configuration
  server_name          = "master"
  redis_version        = "6"
  sku_name             = "Basic"
  capacity             = "1"
  family               = "C"
  non_ssl_port_enabled = true
  day_of_week          = "Sunday"
  start_hour_utc       = "0"
  maintenance_window   = "PT5H"
  high_availability    = false
}

```