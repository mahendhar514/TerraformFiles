resource "aws_instance" "ec2-for-each" {
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.key_name
    #count = length(var.tags) it will not use for (for each loop)
    for_each = toset(var.tags)  #we need this argement for (for-each)
    tags = {
      Name = each.value
    }
}