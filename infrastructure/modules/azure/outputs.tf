

output "static_web_app_url" {
    value = azurerm_static_web_app.portfolio.default_host_name
}

output "static_web_app_api_key" {
    value = azurerm_static_web_app.portfolio.api_key
    sensitive = true
}

output "domain_validation_token" {
    value = azurerm_static_web_app_custom_domain.portfolio.validation_token
}