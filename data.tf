resource "aws_security_group" "opie1_sec-groups" {
  name        = "opie1_allow_rules"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = data.aws_vpc.opie1_existing_vpc.id

  tags = {
    Name = "opie1_firewall_rules"
  }
}
