resource "azurerm_private_endpoint" "main" {
  name                = "${var.tenant}-${var.name}-redis-${var.server_name}-pe-${var.environment}"
  resource_group_name = var.rg_name
  location            = var.rg_location
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "${var.tenant}-${var.name}-redis-${var.server_name}-sc-${var.environment}"
    private_connection_resource_id = azurerm_redis_cache.main.id
    is_manual_connection           = false
    subresource_names              = ["redisCache"]
  }

  private_dns_zone_group {
    name                 = "${var.tenant}-${var.name}-redis-dns-${var.environment}"
    private_dns_zone_ids = [var.prv_dns_id]
  }

  tags = {
    Name        = "${var.tenant}-${var.name}-redis-${var.server_name}-pe-${var.environment}"
    Tenant      = var.tenant
    Project     = var.name
    Environment = var.environment
    Maintainer  = "Magicorn"
    Terraform   = "yes"
  }
}
