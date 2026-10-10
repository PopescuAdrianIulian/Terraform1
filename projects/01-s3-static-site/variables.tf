variable "region" {
  description = "Regiunea AWS"
  type        = string
  default     = "us-east-1"
}

variable "floci_endpoint" {
  description = "Endpoint-ul emulatorului Floci"
  type        = string
  default     = "http://localhost:4566"
}

variable "bucket_name" {
  description = "Numele bucket-ului pentru site"
  type        = string
  default     = "adi-static-site"
}

variable "environment" {
  description = "Mediul (dev/prod)"
  type        = string
  default     = "dev"

  validation {
    condition     = contains(["dev", "prod"], var.environment)
    error_message = "environment trebuie sa fie dev sau prod."
  }
}