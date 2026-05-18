output "vpc_id" {
  description = "AWS VPC ID"
  value       = aws_vpc.hybrid_vpc.id
}

output "vpn_gateway_id" {
  description = "AWS virtual private gateway ID"
  value       = aws_vpn_gateway.vgw.id
}

output "customer_gateway_id" {
  description = "AWS customer gateway ID"
  value       = aws_customer_gateway.onprem_cgw.id
}

output "vpn_connection_id" {
  description = "AWS site-to-site VPN connection ID"
  value       = aws_vpn_connection.site_to_site_vpn.id
}

output "vpn_tunnel_1_address" {
  description = "AWS VPN tunnel 1 outside IP address"
  value       = aws_vpn_connection.site_to_site_vpn.tunnel1_address
}

output "vpn_tunnel_2_address" {
  description = "AWS VPN tunnel 2 outside IP address"
  value       = aws_vpn_connection.site_to_site_vpn.tunnel2_address
}
