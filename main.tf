resource "random_id" "server" {
  keepers = {
    # Generate a new id each time we switch to a new AMI id
    ami_id = "${var.ami_id}"
  }

  byte_length = 8
}

resource "aws_key_pair" "my_key" {
  key_name   = "key-${var.identity}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "server" {
  tags = {
    Name = "web-server ${random_id.server.hex}"
  }

  # Read the AMI id "through" the random_id resource to ensure that both will change together.
  ami = "${random_id.server.keepers.ami_id}"

  instance_type = "${var.instance_type}"

  subnet_id              = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_ids}"]
  key_name               = "${aws_key_pair.my_key.id}"

  connection {
    user        = "${var.username}"
    private_key = "${file("~/.ssh/id_rsa")}"
  }
}
