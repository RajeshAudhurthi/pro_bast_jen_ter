resource "aws_lb_target_group" "test" {
  name     = "tf-example-lb-tg"
  port     = 8080
  protocol = "TCP"
  vpc_id   = aws_vpc.vpc.id
}