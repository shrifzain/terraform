### Security Group Web Tier  ###

resource "aws_security_group" "webserver-security-group" {
  name        = "Web server Security Group"
  description = "Enable direct http/https access on port 80/443 and ssh access"
  vpc_id      = aws_vpc.vpc_test.id

  ingress {
    description = "http access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow direct access to HTTP from any IP
  }

  ingress {
    description = "https access"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow direct access to HTTPS from any IP
  }

  ingress {
    description = "ssh access"
    from_port   = 22
    to_port     = 22
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
    Name = "Web server Security group"
  }
}
