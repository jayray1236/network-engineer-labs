# Terraform Hybrid Cloud VPN Lab

This lab builds a basic AWS-side VPN design for a hybrid cloud connection between an on-prem network and AWS.

## What this lab creates

- AWS VPC
- Public subnet
- Internet gateway
- Route table
- Virtual private gateway
- Customer gateway
- Site-to-site VPN connection

## Example design

On-prem firewall/router public IP:
203.0.113.10

On-prem internal network:
10.10.0.0/16

AWS VPC network:
10.50.0.0/16

## Notes

This is a lab example. Replace the IP addresses with your own lab values before using it. Do not upload real company VPN peer IPs, tunnel keys, or production routes.
