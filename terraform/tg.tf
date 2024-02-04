resource "aws_lb_target_group" "blue" {
  name     = "tf-blue-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

resource "aws_lb_target_group_attachment" "blue" {
  target_group_arn = aws_lb_target_group.blue.arn
  target_id        = aws_instance.web_server.id
  port             = 80
}

resource "aws_lb_target_group" "pink" {
  name     = "tf-pink-lb-tg"
  port     = 81
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

resource "aws_lb_target_group_attachment" "pink" {
  target_group_arn = aws_lb_target_group.pink.arn
  target_id        = aws_instance.web_server.id
  port             = 81
}

resource "aws_lb_target_group" "lime" {
  name     = "tf-lime-lb-tg"
  port     = 82
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.default.id
}

resource "aws_lb_target_group_attachment" "lime" {
  target_group_arn = aws_lb_target_group.lime.arn
  target_id        = aws_instance.web_server.id
  port             = 82
}