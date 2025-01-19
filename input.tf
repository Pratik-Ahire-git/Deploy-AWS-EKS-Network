### Variables for the VPC
variable "aws_vpc_data" {
  type = object({
    cidr = string
    Name = string
  })
  description = "This variables for the vpc Resources"

}

### Public Subnet Variabls
variable "Public_subnet" {
  type = list(object({
    cidr              = string
    availability_zone = string
    Name              = string
  }))
  description = "This Variables use for public Subnet"
}

### Privat Subnet Variables
variable "Private_subnet" {
  type = list(object({
    cidr              = string
    availability_zone = string
    Name              = string
  }))
  description = "This variables for the Private Subnet"
}

### Internet gateway Variable
variable "aws_internet_gateway" {
  type = object({
    Name = string
  })
}

### Public Route Table Variable
variable "Public_Route_table" {
  type = object({
    Name = string
  })
}


# ### Security Group Variables
variable "security_group" {
  type = object({
    name        = string
    description = string
    tag_Name    = string
  })
}

variable "ingress_rule" {
  type = object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })
}

variable "egress_rule" {
  type = object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)

  })

}