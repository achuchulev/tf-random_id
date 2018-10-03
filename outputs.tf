# Define outputs

output "public_ip" {
  value = "${aws_instance.server.public_ip}"
}

output "public_dns" {
  value = "${aws_instance.server.public_dns}"
}

output "subnet_id" {
  value = "${aws_instance.server.subnet_id}"
}
