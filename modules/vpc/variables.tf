variable "prefix" {
  description = "Prefix pentru numele resurselor"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR-ul VPC-ului"
  type        = string
  default     = "10.0.0.0/16"

  validation {
    condition     = can(cidrhost(var.vpc_cidr, 0))
    error_message = "vpc_cidr trebuie sa fie un CIDR valid, ex: 10.0.0.0/16."
  }
}

variable "az_count" {
  description = "Câte AZ-uri folosim"
  type        = number
  default     = 2

  validation {
    condition     = var.az_count >= 1 && var.az_count <= 3
    error_message = "az_count trebuie sa fie intre 1 si 3."
  }
}

variable "single_nat_gateway" {
  description = "true = un NAT pentru toate AZ-urile (ieftin), false = un NAT per AZ (HA)"
  type        = bool
  default     = true
}

variable "allowed_ssh_cidrs" {
  description = "IP-uri care au voie SSH pe SG-ul web"
  type        = list(string)
  default     = []
}