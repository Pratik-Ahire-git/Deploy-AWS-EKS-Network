# ### Resources to Create Security Group for the VPC
resource "aws_security_group" "allow_tls" {
  name        = var.security_group.name
  description = var.security_group.description
  vpc_id      = aws_vpc.Ntier-Network.id

  ingress {
    description = var.ingress_rule.description
    from_port   = var.ingress_rule.from_port
    to_port     = var.ingress_rule.to_port
    protocol    = var.ingress_rule.protocol
    cidr_blocks = var.ingress_rule.cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group.tag_Name
  }
}