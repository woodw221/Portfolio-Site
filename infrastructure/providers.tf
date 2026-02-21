

terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 4.0"
        }
        
        aws = {
            source = "hashicorp/aws"
            version = "~> 6.0"
        }

        cloudflare = {
            source  = "cloudflare/cloudflare"
            version = "~> 4.0"
        }
    }

    backend "azurerm" {
        resource_group_name = "portfoliosite-rg"
        storage_account_name = "portfoliositestore"
        container_name = "portfoliosite"
        key = "portfolio.tfstate"
    }
}

provider "azurerm" {
    features {}
    subscription_id = var.arm_subscription_id
}

provider "aws" {
    region = var.aws_region
    assume_role {
      role_arn = var.aws_role_arn
    }
}

provider "cloudflare" {
    api_token = var.cloudflare_api_token
}
