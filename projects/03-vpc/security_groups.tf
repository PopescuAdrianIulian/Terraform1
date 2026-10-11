#====== sg web pentru load balancer si servere publice

resource "aws_security_group" "web" {
  name        = "${var.prefix}-web-sg"
  description = "HTTP/HTTPS din internet"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name = "${var.prefix}-web-sg"
  }
}

locals {
  web_ports = {
    http  = 80
    https = 443
  }
}

resource "aws_vpc_security_group_ingress_rule" "web" {
  for_each = local.web_ports

  security_group_id = aws_security_group.web.id
  description       = "Allow ${each.key}"
  ip_protocol       = "tcp"
  from_port         = each.value
  to_port           = each.value
  cidr_ipv4         = "0.0.0.0/0"
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  for_each = toset(var.allowed_ssh_cidrs)

  security_group_id = aws_security_group.web.id
  description       = "SSH from ${each.value}"
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_ipv4         = each.value
}

resource "aws_vpc_security_group_egress_rule" "web_all" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
}


resource "aws_security_group" "app" {
  name        = "${var.prefix}-app-sg"
  description = "Trafic aplicatie doar de la SG web"
  vpc_id      = aws_vpc.this.id

  tags = {
    Name = "${var.prefix}-app-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_from_web" {
  security_group_id            = aws_security_group.app.id
  description                  = "App port from web SG"
  ip_protocol                  = "tcp"
  from_port                    = 8080
  to_port                      = 8080
  referenced_security_group_id = aws_security_group.web.id
}

resource "aws_vpc_security_group_egress_rule" "app_all" {
  security_group_id = aws_security_group.app.id
  ip_protocol       = "-1"
  cidr_ipv4         = "0.0.0.0/0"
}









