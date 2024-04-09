# Create an EC2 instance with the specified security group
resource "aws_instance" "web" {
  ami           = "ami-0c2b8ca1dad447f8a" # Example AMI for Amazon Linux 2, change it according to your region and needs
  instance_type = "t2.micro" # Change this to your preferred instance type
  security_groups = [aws_security_group.allow_web.name]

  # User data script to install Nginx and set up the index.html page
  user_data = <<-EOF
              #!/bin/bash
              yum install -y nginx
              systemctl start nginx
              systemctl enable nginx
              echo '<html>
                    <head>
                    <title>Hello World</title>
                    </head>
                    <body>
                    <h1>Hello World!</h1>
                    </body>
                    </html>' > /usr/share/nginx/html/index.html
              EOF

  tags = {
    Name = "NginxServer"
  }
}
