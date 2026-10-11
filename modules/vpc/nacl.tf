locals {
  private_nacl_ingress = [
    {
      rule_no    = 100
      protocol   = "-1"
      cidr_block = var.vpc_cidr # tot ce vine din VPC
      from_port  = 0
      to_port    = 0
    },
    {
      rule_no    = 200
      protocol   = "tcp"
      cidr_block = "0.0.0.0/0" # RĂSPUNSURI din internet (prin NAT)
      from_port  = 1024
      to_port    = 65535
    },
  ]
}

resource "aws_network_acl" "private" {
  vpc_id     = aws_vpc.this.id
  subnet_ids = [for s in aws_subnet.private : s.id]

  dynamic "ingress" {
    for_each = local.private_nacl_ingress

    content {
      rule_no    = ingress.value.rule_no
      action     = "allow"
      protocol   = ingress.value.protocol
      cidr_block = ingress.value.cidr_block
      from_port  = ingress.value.from_port
      to_port    = ingress.value.to_port
    }
  }

  egress {
    rule_no    = 100
    action     = "allow"
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "${var.prefix}-private-nacl"
  }
}