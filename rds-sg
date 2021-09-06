resource "aws_security_group" "rds-sg" {
  depends_on = [
    aws_vpc.vpc,
  ]
  name        = "my-rds-sg"
  description = "Allow Bastain inbound traffic"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "allow Bastain"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_bastion_host.id]
  }
}