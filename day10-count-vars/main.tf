resource "aws_instance" "count" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    count = length(var.tags)
    tags = {
      Name = var.tags[count.index]
    }
}