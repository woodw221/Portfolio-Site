

#module "azure" {
#    source = "./modules/azure"
#    project_name = var.project_name
#    location = var.azure_location
#    domain_name = var.domain_name
#}

resource "cloudflare_record" "portfolio" {
    zone_id = var.cloudflare_zone_id
    name = "@"
    content = module.azure.static_web_app_url
    type = "CNAME"
    proxied = true
    ttl = 1
}