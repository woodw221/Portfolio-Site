

#module "azure" {
#    source = "./modules/azure"
#    project_name = var.project_name
#    location = var.azure_location
#    domain_name = var.domain_name
#}

resource "cloudflare_record" "portfolio" {
    zone_id = var.cloudflare_zone_id
    name = "@"
    content = "proud-rock-0b9c6ba0f.6.azurestaticapps.net"
    type = "CNAME"
    proxied = true
    ttl = 1
}