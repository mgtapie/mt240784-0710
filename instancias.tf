resource "aws_instance" "instancia-07OCT" {
  ami           = "ami-0817d428a6fb68645"
  instance_type = "t2.micro"
  key_name      = "practico-2"
  vpc_security_group_ids = [aws_security_group.practico-07OCT.id,
  ]
  subnet_id = aws_subnet.practico2-private-subnet.id
  tags = {
    Name = "practico-07OCT-240784"
  }
  connection {
      type = "ssh"
      user = "ubuntu"
      private_key = file("C:\\Users/Martin/Desktop/practico-2.pem")
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