# jenkins security group
resource "aws_security_group" "sg_jenkins" {
  depends_on = [
    aws_vpc.vpc,
  ]
  name        = "sg jenkins"
  description = "Allow jenkins inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "allow TCP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_bastion_host.id]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# jenkins ec2 instance
resource "aws_instance" "jenkins" {
  depends_on = [
    aws_security_group.sg_jenkins,
    aws_nat_gateway.nat_gateway,
    aws_route_table_association.associate_routetable_to_private_subnet,
  ]
  ami = var.amiid
  instance_type = var.instancetype
  key_name = var.keyname
  vpc_security_group_ids = [aws_security_group.sg_jenkins.id]
  subnet_id = aws_subnet.private_subnet.id
  user_data = file("configure_jenkins.sh")
  tags = {
      Name = "jenkins-instance"
  }
}