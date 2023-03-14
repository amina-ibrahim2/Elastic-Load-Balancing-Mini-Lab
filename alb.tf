resource "aws_lb" "my-ALB" {
  name               = "Test-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my-test-ALB-sg.id]
  subnets           = [data.aws_subnet.public-a,data.aws_subnet.private-a,data.aws_subnet.private-b,data.aws_subnet.private-c]
 
  #enable_deletion_protection = true
  tags = {
    Environment = "my-ALB"
  }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.Test-ALB.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    forward {
      target_group {
        arn = aws_lb_target_group.my-test-target-group-1.arn
      }

      # target_group {
      #   arn = aws_lb_target_group.blue_target.arn
      # }

      # target_group {
      #   arn = aws_lb_target_group.white_target.arn
      # }
    }

  }
}
