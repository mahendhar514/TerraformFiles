variable "ami" {
    type = string
    default = "ami-04629cfb3bd2d73f3"  
}
variable "instance_type" {
    type = string
    default = "t2.micro"  
}
variable "key_name" {
    type = string
    default = "pemkey"
}