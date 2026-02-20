

terraform {
    required_providers {
        azurerm = {
            source  = "hashicorp/azurerm"
            version = "~> 3.0"
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
    features {
      
    }
}

provider "cloudflare" {
    api_token = var.cloudflare_api_token
}
