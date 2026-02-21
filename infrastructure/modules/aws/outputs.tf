

output "aws_s3_bucket_name" {
    value = aws_s3_bucket.portfolio.bucket
}

output "cloudfront_domain" {
    value = aws_cloudfront_distribution.portfolio.domain_name
}

output "cloudfront_distribution_id" {
    value = aws_cloudfront_distribution.portfolio.id
}