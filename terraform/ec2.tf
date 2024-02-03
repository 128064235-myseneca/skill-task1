data "aws_ami" "aws_image" {
  owners      = ["amazon"]
  most_recent = true

}

resource "aws_instance" "web_server" {
  ami           = data.aws_ami.aws_image.id
  instance_type = "t2.micro"
  subnet_id     = aws_default_subnet.default_az1.id
  key_name      = aws_key_pair.mykey.key_name
}


resource "aws_key_pair" "mykey" {
  key_name   = "assignment-1"
  public_key = file("assignment1.pub")
}