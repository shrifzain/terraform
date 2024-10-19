



resource "aws_instance" "PublicWebTemplate" {
  ami                    =  "ami-005fc0f236362e99f" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public-webtier-subnet-1.id
  vpc_security_group_ids = [aws_security_group.webserver-security-group.id]
  key_name               = "open"
  user_data              = file("install-docker.sh")

  tags = {
    Name = "webtier-instance"
  }
}





resource "aws_instance" "private-app-template" {
  ami                    = "ami-005fc0f236362e99f" 
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private-apptier-subnet-1.id
  vpc_security_group_ids = [aws_security_group.ssh-security-group.id]
  key_name               = "open"
  user_data              = file("install-docker.sh")

  tags = {
    Name = "apptier-instance"
  }
}






