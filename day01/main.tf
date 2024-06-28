resource "aws_instance" "localname" {
    ami = "ami-04629cfb3bd2d73f3"
    instance_type = "t2.micro"
    key_name = "pemkey"
    subnet_id = "subnet-0cd7d5b669714f5e6"
    security_groups = [ "sg-05f352f5ac337804a" ]
    tags = {
      Name = "terraform22"
    }
}