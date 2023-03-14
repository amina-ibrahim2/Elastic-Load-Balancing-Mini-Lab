# DATA SOURCE FOR AMI
data "aws_ami" "aws_linux" {
  owners      = [var.aws_owner_id]
  most_recent = true
  filter {
    name   = "name"
    values = [var.aws_ami_name]
  }
}

data "aws_vpc" "main_vpc" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]

  }
}

data "aws_subnet" "public-a" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}

data "aws_subnet" "private-a" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name]
  }
}


data "aws_subnet" "private-b" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name2]
  }
}


data "aws_subnet" "private-c" {
  filter {
    name   = "tag:Name"
    values = [var.private_subnet_name3]
  }
}

resource "aws_lb_target_group" "Test-ALB" {
  name        = "tf-example-lb-alb-tg"
  target_type = "alb"
  port        = 80
  protocol    = "TCP"
  vpc_id      = aws_vpc.main.id
}

resource "aws_lb" "Test-ALB" {
  # ...
}



resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.front_end.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front_end.arn
  }
}
