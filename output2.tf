output "my-vm-public-ip" {
  value = aws_instance.example.public_ip
  description = "this is for printing the output in the terminal window"
}

resource "local_file" "Oplinger-file" {
  content  = aws_instance.example.public_ip
  filename = "${path.module}/my-ip.txt"
  #description - this is for outputting to a file
}
