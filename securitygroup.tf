resource "aws_security_group" "opie1_sec-groups" {
  name        = "opie1_allow_rules"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.opie1_existing_vpc.id

  tags = {
    Name = "opie1_firewall_rules"
  }
}

# allow all outgoing ports for ipv4

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.opie1_sec-groups.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

# allow engress ports 22 and 80 for ipv4
resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.opie1_sec-groups.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.opie1_sec-groups.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}