locals {
  site_dir = "${path.module}/site"


  mime_types = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
    ".svg"  = "image/svg+xml"
  }

  index_html = templatefile("${path.module}/templates/index.html.tftpl", {
    environment = var.environment
    bucket_name = var.bucket_name
  })
}

resource "aws_s3_object" "static" {
  for_each = fileset(local.site_dir, "**")

  bucket       = aws_s3_bucket.site.id
  key          = each.value
  source       = "${local.site_dir}/${each.value}"
  etag         = filemd5("${local.site_dir}/${each.value}")
  content_type = lookup(local.mime_types, regex("\\.[^.]+$", each.value), "application/octet-stream")
}


resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.site.id
  key          = "index.html"
  content      = local.index_html
  etag         = md5(local.index_html)
  content_type = "text/html"
}