###############################################################################
#  Terraform Template variable declarion file
#
#  Version:     1.0		Date: 11/05/2017		
#          
#
#  Prepared by:  Nandakumar Umapathy
# 
#  This script declare all variables used in main.tf
#  Comments are enclosed ith a hash (#).Everything outside is a valid variable.
#
#  Usage - terraform apply
###############################################################################

# Access key and Region definition
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}

# Environment to be creation (eg) dev,test,qa
variable "app_environment" {
  description = "AppEnvironment tag"
  default = "DEV"
}

# Application owner/admin contact
variable "app_contact" {
  description = "App contact tag"
  default = "support@abc.com"
}

# Company name
variable "company" {
  description = "Company name tag"
  default = "ABC Company"
}