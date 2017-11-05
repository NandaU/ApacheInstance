###############################################################################
#  Terraform Template to create security groups
#
#  Version:     1.0		Date: 11/05/2017		
#          
#
#  Prepared by:  Nandakumar Umapathy
# 
#  This script creates security groups to allow ssh and web traffic 
#  Comments are enclosed ith a hash (#).Everything outside is a valid variable.
#
#  Usage - terraform apply
###############################################################################

# Security group to allow ssh port 22 and web traffic port 80
# Here source is all IP. This is a security risk for port 22 rule.
# Alter this to your specific IP or company public gateway

resource "aws_security_group" "allow-web-traffic" {
  vpc_id = "${aws_vpc.main.id}"
  name = "allow-web-traffic"
  description = "security group that allows ssh and all egress traffic"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  } 
  ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
  } 
  tags {
    Name = "Web Traffic Rule"
  }
  
  tags {
    Environment	= "${var.app_environment}"
  }
}
