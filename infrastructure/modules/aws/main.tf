

resource "aws_s3_bucket" "portfolio" {
    bucket = "${var.project_name}-portfolio-site"
}

resource "aws_s3_bucket_website_configuration" "portfolio" {
    bucket = aws_s3_bucket.portfolio.id

    index_document {
      suffix = "index.html"
    }

    error_document {
      key = "404.html"
    }
}

resource "aws_s3_bucket_public_access_block" "portfolio" {
    bucket = aws_s3_bucket.portfolio.id
    block_public_acls = false
    block_public_policy = false
    ignore_public_acls = false
    restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "portfolio" {
    bucket = aws_s3_bucket.portfolio.id
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Sid = "PublicReadGetObject"
            Effect = "Allow"
            Principal = "*"
            Action = "s3:GetObject"
            Resource = "${aws_s3_bucket.portfolio.arn}/*"
        }]
    })
    depends_on = [ aws_s3_bucket_public_access_block.portfolio ]
}

resource "aws_cloudfront_distribution" "portfolio" {
    enabled = true
    default_root_object = "index.html"
    price_class = "PriceClass_100"
    aliases = [var.domain_name]

    origin {
      domain_name = aws_s3_bucket_website_configuration.portfolio.website_endpoint
      origin_id = "s3-portfolio"

      custom_origin_config {
        http_port = 80
        https_port = 443
        origin_protocol_policy = "http-only"
        origin_ssl_protocols = ["TLSv1.2"]
      }
    }

    default_cache_behavior {
      target_origin_id = "s3-portfolio"
      viewer_protocol_policy = "redirect-to-https"
      allowed_methods = ["GET", "HEAD"]
      cached_methods = ["GET", "HEAD"]
      compress = true

      forwarded_values {
        query_string = false
        cookies { forward = "none"}
        }   

        min_ttl = 0
        default_ttl = 3600
        max_ttl = 86400
    }

    

    custom_error_response {
      error_code = 404
      response_code = 200
      response_page_path = "/index.html"
    }

    restrictions {
      geo_restriction {
        restriction_type = "none"
      }
    }
    
    viewer_certificate {
      acm_certificate_arn = var.certificate_arn
      ssl_support_method = "sni-only"
      minimum_protocol_version = "TLSv1.2_2021"
    }

    tags = {
      project = var.project_name
    }

}