
## Resource to create AWS VPC
resource "aws_vpc" "Ntier-Network" {
  cidr_block       = var.aws_vpc_data.cidr
  instance_tenancy = "default"
  tags = {
    Name = var.aws_vpc_data.Name
  }
}

## Resource to create public Subnets for the VPC
resource "aws_subnet" "Ntier-Network-Public-Subnets" {
  count             = length(var.Public_subnet)
  vpc_id            = aws_vpc.Ntier-Network.id
  cidr_block        = var.Public_subnet[count.index].cidr
  availability_zone = var.Public_subnet[count.index].availability_zone
  
  map_public_ip_on_launch = true

  tags = {
    Name = var.Public_subnet[count.index].Name
  }

}

### Resource to create Private Subnets for the VPC
resource "aws_subnet" "Ntier-Network-Private-Subnet" {
  count             = length(var.Private_subnet)
  vpc_id            = aws_vpc.Ntier-Network.id
  cidr_block        = var.Private_subnet[count.index].cidr
  availability_zone = var.Private_subnet[count.index].availability_zone
  tags = {
    Name = var.Private_subnet[count.index].Name
  }

}
### Resources to create Internet gateway for the VPC
resource "aws_internet_gateway" "Ntier-Network-Internet-gateway" {
  vpc_id = aws_vpc.Ntier-Network.id
  tags = {
    Name = var.aws_internet_gateway.Name
  }
}

### Resources to create Route table 
resource "aws_route_table" "Public_Route_table" {
  count  = length(aws_subnet.Ntier-Network-Public-Subnets)
  vpc_id = aws_vpc.Ntier-Network.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Ntier-Network-Internet-gateway.id
  }
  tags = {
    Name = var.aws_internet_gateway.Name
  }
  depends_on = [
    aws_vpc.Ntier-Network,
    aws_vpc.Ntier-Network
  ]
}

### Resources to Associate the Subnet to the public Routable
resource "aws_route_table_association" "route_association" {
  count          = length(aws_subnet.Ntier-Network-Public-Subnets)
  subnet_id      = aws_subnet.Ntier-Network-Public-Subnets[count.index].id
  route_table_id = aws_route_table.Public_Route_table[count.index].id

  depends_on = [
    aws_subnet.Ntier-Network-Public-Subnets,
    aws_route_table.Public_Route_table
  ]
}

