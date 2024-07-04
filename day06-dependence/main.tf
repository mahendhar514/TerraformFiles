resource "aws_instance" "ec2instance" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    key_name = "pemkey"
}

resource "aws_s3_bucket" "cratingbucket" {
    bucket = "mahendharemmadi514"
    depends_on = [ aws_instance.ec2instance ]
}