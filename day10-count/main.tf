resource "aws_instance" "count" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "pemkey"
    count = 2
    tags = {
      Name = "dev.${count.index}"
    }
}