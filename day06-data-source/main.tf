resource "aws_instance" "linuxinstance" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    key_name = "pemkey"
    tags = {
      Name = "data-source-instance"
    }
}