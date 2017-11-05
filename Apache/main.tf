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

  # EC2 instance creation step
  
  resource "aws_instance" "terraformec2creation" {
  ami           = "ami-8c1be5f6"
  instance_type = "t2.micro"
  key_name 	= "MyEC2labkeypair"	
  
  # Get subnet ID
    subnet_id = "${aws_subnet.main-public-1.id}"
  
  # Attach security group
  security_groups = ["${aws_security_group.allow-web-traffic.id}"]
  
  # Add tags
  tags {
      Name 		= "Test Terraform Instance"
  }
  
  tags {
      Environment	= "${var.app_environment}"
  }
  
  tags {
      Contact		= "${var.app_contact}"
  }
  
  tags {
      Company		= "${var.company}"
  }
    
  # User data to install apache and add Index.html file
  # Increase sleep time if necessary as sometimes yum update takes longer based on
  # number of updates to download and install
  
  provisioner "remote-exec" {
      inline = [
     "sudo yum install httpd -y",
     "sudo sleep 3m",
     "sudo yum update -y",
     "sudo sleep 3m",
     "sudo chmod -R 777 /var/www/html",
     "sudo echo '<html><h1> Terraform for the People</h1></html>' > /var/www/html/index.html",
     "sudo sleep 2m",
     "sudo chmod -R 775 /var/www/html",
     "sudo sleep 2m",
     "sudo service httpd start",
     "sudo ps -ef|grep httpd"
    ]
  } 
  
 # SSH connection parameter to install apache
 # Here MyEC2labkeypair.pem is the private key.
 # Repalce with your own key
 connection {
      type = "ssh"
      user = "ec2-user"
      private_key = "${file("MyEC2labkeypair.pem")}"
      agent = false
  }
  
}