###############################################################################
#  Terraform Template provider declaration- aws
#
#  Version:     1.0		Date: 11/05/2017		
#          
#
#  Prepared by:  Nandakumar Umapathy
# 
#  This script configures which provider to be used
#  Comments are enclosed ith a hash (#).Everything outside is a valid variable.
#
#  Usage - terraform apply
###############################################################################

# AWS provider
provider "aws" {
    access_key = "${var.AWS_ACCESS_KEY}"
    secret_key = "${var.AWS_SECRET_KEY}"
    region = "${var.AWS_REGION}"
}

