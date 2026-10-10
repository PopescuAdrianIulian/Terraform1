provider "aws" {
  region     = var.region
  access_key = "test"
  secret_key = "test"

  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  s3_use_path_style = true
  endpoints {
    s3  = var.floci_endpoint
    sts = var.floci_endpoint
  }

  default_tags {
    tags = {
      Project   = "00-setup"
      ManagedBy = "terraform"
    }
  }
}