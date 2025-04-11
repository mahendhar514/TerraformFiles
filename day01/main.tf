resource "aws_instance" "localname" {
    ami = "ami-080b1a55a0ad28c02"
    instance_type = "t2.micro"
    count = 10
    key_name = "AWS"
    subnet_id = "subnet-063ae2d7ba8f201ae"
    security_groups = [ "sg-0e858433fd4b326e7" ]
    tags = {
      Name = "terraform22"
    }
}