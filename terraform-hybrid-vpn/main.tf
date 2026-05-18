# Create the AWS VPC
resource "aws_vpc" "hybrid_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "hybrid-cloud-vpc"
  }
}

# Create a public subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.hybrid_vpc.id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "hybrid-public-subnet"
  }
}

# Create an internet gateway for public access
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.hybrid_vpc.id

  tags = {
    Name = "hybrid-vpc-igw"
  }
}

# Create a route table for the public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.hybrid_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "hybrid-public-route-table"
  }
}

# Associate route table with public subnet
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

# Create a virtual private gateway on the AWS side
resource "aws_vpn_gateway" "vgw" {
  vpc_id = aws_vpc.hybrid_vpc.id

  tags = {
    Name = "hybrid-vpn-gateway"
  }
}

# Create a customer gateway representing the on-prem firewall/router
resource "aws_customer_gateway" "onprem_cgw" {
  bgp_asn    = 65010
  ip_address = var.onprem_public_ip
  type       = "ipsec.1"

  tags = {
    Name = "onprem-customer-gateway"
  }
}

# Create the site-to-site VPN connection
resource "aws_vpn_connection" "site_to_site_vpn" {
  vpn_gateway_id      = aws_vpn_gateway.vgw.id
  customer_gateway_id = aws_customer_gateway.onprem_cgw.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "aws-to-onprem-site-to-site-vpn"
  }
}

# Add static route for the on-prem network across the VPN
resource "aws_vpn_connection_route" "onprem_route" {
  destination_cidr_block = var.onprem_network_cidr
  vpn_connection_id      = aws_vpn_connection.site_to_site_vpn.id
}

# Add route in AWS route table pointing on-prem traffic to the VPN gateway
resource "aws_route" "route_to_onprem" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = var.onprem_network_cidr
  gateway_id             = aws_vpn_gateway.vgw.id
}
