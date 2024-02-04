resource "aws_lb" "assignment1" {
  name               = "assignment1-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb.id]
  subnets            = [aws_default_subnet.default_az1.id, aws_default_subnet.default_az2.id]

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_listener" "front_end" {
  load_balancer_arn = aws_lb.assignment1.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }
}


resource "aws_lb_listener_rule" "blue_redirect" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.blue.arn
  }

  condition {
    path_pattern {
      values = ["blue"]
    }
  }
}

resource "aws_lb_listener_rule" "pink_redirect" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 102

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pink.arn
  }

  condition {
    path_pattern {
      values = ["pink"]
    }
  }
}

resource "aws_lb_listener_rule" "lime_redirect" {
  listener_arn = aws_lb_listener.front_end.arn
  priority     = 101

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lime.arn
  }

  condition {
    path_pattern {
      values = ["lime"]
    }
  }
}