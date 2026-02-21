
#output "azure_url" {
#    description = "Azure Web URL"
#    value = module.azure.static_web_app_url
#}

#output "azure_deploy_token" {
#    description = "Azure Web App Deploy Token"
#    value = module.azure.static_web_app_api_key
#    sensitive = true
#}

#output "domain_validation_token" {
#    description = "Text Record Value needed to verify ownership"
#    value = module.azure.domain_validation_token
#    sensitive = true
#}

output "aws_cloudfront_url" {
    description = "AWS Cloudfront Domain Name"
    value = module.aws.cloudfront_domain
}

output "aws_s3_bucket_name" {
    description = "AWS S3 name"
    value = module.aws.aws_s3_bucket_name
}