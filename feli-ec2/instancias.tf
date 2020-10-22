resource "aws_instance" "feli-EC2" {
  ami           = "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
  key_name      = "feli-key"
  vpc_security_group_ids = [aws_security_group.feli-security-group.id,
  ]
  subnet_id = aws_subnet.feli-private-subnet.id
  tags = {
    Name = "feli-ec2"
  }
  connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("C:\\Users/Martin/Desktop/feli-key.pem")
      host = self.public_ip
      }
      provisioner "remote-exec" {
          inline = [
            "sudo apt-get update -y",
            "sudo apt-get install -y ca-certificates wget",
            "wget https://get.glennr.nl/unifi/install/unifi-5.13.32.sh",
          ]
          on_failure = continue
      }
}