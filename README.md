###############################################################################
#  Terraform Template Amazon Linux Apache-No-ELB
#
#  Version:     1.0		Date: 11/05/2017		
#          
#
#  Prepared by:  Nandakumar Umapathy
# 
#  This script creates Amazon Linux EC2 instance with apache installed 
#  with index.html page.
#  This has dependency on creation of VPC, public subnet, Internet Gateway, 
#  security groups, key file pair
#
#  Comments are enclosed ith a hash (#).Everything outside is a valid variable.
#
#  Usage - terraform apply
###############################################################################

# File Overview
File 		| Description
--------------- | -------------
main.tf		- Creation of EC2 instance
securitygroup.tf- Security group creation
vars.tf		- Variable declaration
vpc.tf		- VPC, subnet,IGW,Route table creation
provider.tf	- Specify which provider to be used

# Dependency
private key file  - *.pem file
terraform.tfvars  - Contains sensitive access keys

# Usage
- terraform plan
- Verify output and then apply
- terraform apply

