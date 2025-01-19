aws_vpc_data = {
  Name = "Nop_Network"
  cidr = "10.0.0.0/16"
}

Public_subnet = [{
  Name              = "web-1"
  availability_zone = "ap-south-2a"
  cidr              = "10.0.0.0/24"
  },
  {
    Name              = "web-2"
    availability_zone = "ap-south-2b"
    cidr              = "10.0.1.0/24"
}]

Private_subnet = [{
  Name              = "app-1"
  availability_zone = "ap-south-2c"
  cidr              = "10.0.2.0/24"
  },
  {
    Name              = "app-2"
    availability_zone = "ap-south-2a"
    cidr              = "10.0.3.0/24"
}]

aws_internet_gateway = {
  Name = "nop-network-IG"
}

Public_Route_table = {
  Name = "nop-route"
}

security_group = {
  name        = "Allow_tls"
  description = "Allow TLS inbound traffic"
  tag_Name    = "nop"
}

ingress_rule = {
  description = "TLS from vpc"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

egress_rule = {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}