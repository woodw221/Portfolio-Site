
variable "project_name" {
    description = "Used to name resources in both providers"
    type = string
    default = "portfolio"
}

variable "azure_location" {
    description = "Azure Region"
    type = string
    default = "East US 2"
}

variable "arm_subscription_id" {
    description = "Azure Subscription ID"
    type = string
    sensitive = true
}

variable "domain_name" {
    description = "My Domain"
    type = string
}

variable "aws_region" {
    description = "AWS Region"
    type = string
    default = "us-east-1"
}

variable "cloudflare_zone_id" {
    description = "Zone ID for Domain"
    type = string
    sensitive = true
}

variable "cloudflare_api_token" {
    description = "Cloudflare API Token"
    type = string
    sensitive = true
}
