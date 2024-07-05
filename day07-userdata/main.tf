resource "aws_instance" "userdata" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "pemkey"
    user_data = file("userdata.sh")
    tags = {
      Name = "userdata-instance"
    }
}