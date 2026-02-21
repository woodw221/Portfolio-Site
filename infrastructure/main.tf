

#module "azure" {
#    source = "./modules/azure"
#    project_name = var.project_name
#    location = var.azure_location
#    domain_name = var.domain_name
#}

module "aws" {
    source = "./modules/aws"
    project_name = var.project_name
    certificate_arn = module.aws_cert.certificate_arn
    domain_name = var.domain_name
}

module "aws_cert" {
    source = "./modules/aws-cert"
    domain_name = var.domain_name
    cloudflare_zone_id = var.cloudflare_zone_id
}

resource "cloudflare_record" "portfolio" {
    zone_id = var.cloudflare_zone_id
    name = "@"
    content = "proud-rock-0b9c6ba0f.6.azurestaticapps.net"
    type = "CNAME"
    proxied = true
    ttl = 1
}

