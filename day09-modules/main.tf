module "ec2-instance" {
    source = "../day01-tfvars"
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "AWS"
    tags = {
     Name = "modules"
    }
}