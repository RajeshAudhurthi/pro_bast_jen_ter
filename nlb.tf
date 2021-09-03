resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"
  subnets            = aws_subnet.public_subnet.*.id

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}