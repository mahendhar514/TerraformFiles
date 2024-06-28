resource "aws_security_group" "cust" {
  name        = "cust-sg-tf"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.cust.id

  tags = {
    Name = "security-group-tf"
  }
}


resource "aws_vpc_security_group_ingress_rule" "cust11" {
  security_group_id = aws_security_group.cust.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "cust12" {
  security_group_id = aws_security_group.cust.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "cust13" {
  security_group_id = aws_security_group.cust.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_egress_rule" "cust14" {
  security_group_id = aws_security_group.cust.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
