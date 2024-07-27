#creating custom vpc network
resource "aws_vpc" "cust" {
    cidr_block = "196.56.0.0/20"
    tags = {
      Name = "custom-vpc-tf"
    }
}

#creating internet gateway for custom vpc
resource "aws_internet_gateway" "cust" {
    vpc_id = aws_vpc.cust.id
    tags = {
      Name = "igw-tf"
    }
}

#creating subnet for custom public subnet in 1a AZ vpc
resource "aws_subnet" "cust1" {
vpc_id = aws_vpc.cust.id
cidr_block = "196.56.0.0/22"
availability_zone = "ap-south-1a"
map_public_ip_on_launch = true
tags = {
  Name = "public-subnet-1a-tf"
}
}

#creating subnet for custom public subnet in 1b AZ vpc
resource "aws_subnet" "cust2" {
vpc_id = aws_vpc.cust.id
cidr_block = "196.56.4.0/22"
availability_zone = "ap-south-1b"
map_public_ip_on_launch = true
tags = {
  Name = "public-subnet-1b-tf"
}
}

#creating subnet for custom private subnet in 1a AZ vpc
resource "aws_subnet" "cust3" {
vpc_id = aws_vpc.cust.id
cidr_block = "196.56.8.0/22"
availability_zone = "ap-south-1a"
tags = {
  Name = "private-subnet-1a-tf"
}
}

#creating subnet for custom private subnet in 1b AZ vpc
resource "aws_subnet" "cust4" {
vpc_id = aws_vpc.cust.id
cidr_block = "196.56.12.0/22"
availability_zone = "ap-south-1b"
tags = {
  Name = "private-subnet-1b-tf"
}
}

#creating public route table
resource "aws_route_table" "cust5" {
vpc_id = aws_vpc.cust.id
route{
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.cust.id   #attaching internet gatewate to the routetable
}
tags = {
  Name ="public-route-table-tf"
}
}

#creating elastic ip for nat gateway
resource "aws_eip" "cust" {
tags = {
  Name = "eip-for-nat-tf"
}  
}

#creting nat gateway
resource "aws_nat_gateway" "cust" {
  allocation_id = aws_eip.cust.id   #associate elastic ip to nategateway
  subnet_id     = aws_subnet.cust1.id   #associating public subnet to nategateway
  tags = {
    Name = "cust-NAT-tf"
  }
}

#creating private route table
resource "aws_route_table" "cust6" {
vpc_id = aws_vpc.cust.id
route{
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.cust.id   #attaching natgateway to the route table
}
tags = {
  Name = "private-route-table-tf"
}
}

#subnet association for puble route table (1a AZ subnet)
resource "aws_route_table_association" "cust7" {
    route_table_id = aws_route_table.cust5.id
    subnet_id = aws_subnet.cust1.id
}

#subnet association for puble route table (1b AZ subnet)
resource "aws_route_table_association" "cust8" {
    route_table_id = aws_route_table.cust5.id
    subnet_id = aws_subnet.cust2.id
}

#subnet association for private route table (1a AZ subnet)
resource "aws_route_table_association" "cust9" {
    route_table_id = aws_route_table.cust6.id
    subnet_id = aws_subnet.cust3.id
}

#subnet association for private route table (1b AZ subnet)
resource "aws_route_table_association" "cust10" {
    route_table_id = aws_route_table.cust6.id
    subnet_id = aws_subnet.cust4.id
}
