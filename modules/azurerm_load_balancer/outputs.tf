output "backend_pool_id" {

  value = {

    for k, v in azurerm_lb_backend_address_pool.backend_pool :

    k => v.id

  }

}