
terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
    }

    cloudflare = {
        source = "cloudflare/cloudflare"
        version = "~> 4.0"
    }
  }
}


resource "aws_acm_certificate" "portfolio" {
    domain_name = var.domain_name
    validation_method = "DNS"

    lifecycle {
      create_before_destroy = true
    }

    tags = {
      project = "portfolio"
    }
}

resource "cloudflare_record" "cert_validation" {
    for_each = {
      for dvo in aws_acm_certificate.portfolio.domain.validation_options : dvo.domain_name => {
        name = dvo.resource_record_name
        value = dvo.resource_record_value
        type = dvo.resource_record_type
      }
    }

    zone_id = var.cloudflare_zone_id
    name = each.value.name
    content = each.value.value
    type = each.value.type
    ttl = 60
}

resource "aws_acm_certificate_validation" "portfolio" {
    certificate_arn = aws_acm_certificate.portfolio.arn
    validation_record_fqdns = [for record in cloudflare_record.cert_validation : record.hostname] 
}

