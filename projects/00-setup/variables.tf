variable "region" {
  description = "Regiune aws"
  type = string
  default = us-east-1
}

variable "floci_endpoint" {
  description = "Endpoints pt floci"
  type = string
  default = "http://localhost:4566"
}

variable "bucket_name" {
  description = "Numele bucketului s3"
  type = string
  default = "adi-primul-bucket"
}
