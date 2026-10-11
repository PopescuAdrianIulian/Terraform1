variable "region" {
  type    = string
  default = "us-east-1"
}

variable "floci_endpoint" {
  type    = string
  default = "http://localhost:4566"
}

variable "prefix" {
  description = "Prefix pentru numele resurselor"
  type        = string
  default     = "adi-lab"
}