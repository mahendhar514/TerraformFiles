resource "aws_instance" "cust" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.cust1.id
    security_groups = [ aws_security_group.cust.id ]
    tags = {
        Name = "cust-instance-vpc"
    }
}