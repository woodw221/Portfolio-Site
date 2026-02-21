

variable "domain_name" {
    description = "Domain name"
    type = string
}

variable "cloudflare_zone_id" {
    description = "Cloudflare zone id"
    type = string
    sensitive = true
}