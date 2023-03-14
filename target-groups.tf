resource "aws_lb_target_group" "my-test-red-server-az1" {
  name     = "my-test-red-server-az1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_lb_target_group" "blue_target" {
  name     = "green-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_lb_target_group" "white_target" {
  name     = "white-target"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_autoscaling_attachment" "asg_attachment_red" {
  autoscaling_group_name = aws_autoscaling_group.red.id
  lb_target_group_arn    = aws_lb_target_group.red_target.arn
}

resource "aws_autoscaling_attachment" "asg_attachment_blue" {
  autoscaling_group_name = aws_autoscaling_group.blue.id
  lb_target_group_arn    = aws_lb_target_group.blue_target.arn
}

resource "aws_autoscaling_attachment" "asg_attachment_white" {
  autoscaling_group_name = aws_autoscaling_group.white.id
  lb_target_group_arn    = aws_lb_target_group.white_target.arn
}
