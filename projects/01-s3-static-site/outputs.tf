output "bucket_name" {
  value       = aws_s3_bucket.site.id
  description = "Id ul bucket-ului"
}

output "website_endpoint" {
  value = aws_s3_bucket_website_configuration.site.website_endpoint
  description = "Endpointul website ului"
}

output "floci_url" {
  description = "URL de test local"
  value       = "${var.floci_endpoint}/${aws_s3_bucket.site.id}/index.html"
}

output "uploaded_files" {
  value = keys(aws_s3_object.static)
}