
output "azure_url" {
    description = "Azure Web URL"
    value = module.azure.static_web_app_url
}

output "azure_deploy_token" {
    description = "Azure Web App Deploy Token"
    value = module.azure.static_web_app_api_key
    sensitive = true
}

output "domain_validation_token" {
    description = "Text Record Value needed to verify ownership"
    value = module.azure.domain_validation_token
}