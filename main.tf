resource "azurerm_redis_cache" "main" {
  name                          = "${var.tenant}-${var.name}-redis-${var.server_name}-${var.environment}"
  resource_group_name           = var.rg_name
  location                      = var.rg_location
  redis_version                 = var.redis_version
  sku_name                      = var.sku_name
  capacity                      = var.capacity
  family                        = var.family
  non_ssl_port_enabled          = var.non_ssl_port_enabled
  minimum_tls_version           = "1.2"
  public_network_access_enabled = false
  subnet_id                     = (var.sku_name == "Basic" || var.sku_name == "Standard") ? null : var.subnet_id
  zones                         = (var.sku_name == "Basic" || var.sku_name == "Standard") ? null : [1, 2]

  patch_schedule {
    day_of_week        = var.day_of_week
    start_hour_utc     = var.start_hour_utc
    maintenance_window = var.maintenance_window
  }

  redis_configuration {
    aof_backup_enabled = false
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-redis-${var.server_name}-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}
