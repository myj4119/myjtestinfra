resource "aws_instance" "web_ec2" {
  ami           = data.aws_ami.amzl2.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_ec2_sg.id]
  key_name = var.key_pair
  subnet_id = aws_subnet.public.id

  user_data = filebase64("./script/userdata.sh")

  user_data_replace_on_change = true

  tags = {
    Name = format(
        "%s-%s-web_ec2",
        var.nickname,
        var.environment
    )
  }
}

resource "aws_security_group" "web_ec2_sg" {
  vpc_id = aws_vpc.vpc_isnt_test.id
  name = "web_ec2_sg"

  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = format(
        "%s-%s-web_ec2_sg",
        var.nickname,
        var.environment
    )
  }
}
