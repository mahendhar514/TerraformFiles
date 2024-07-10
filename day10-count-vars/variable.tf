variable "ami" {
    type = string
    default = "ami-01376101673c89611"
}
variable "instance_type" {
    type = string
    default = "t2.micro"
}
variable "key_name" {
    type = string
    default = "pemkey"
}
variable "tags" {
    type = list(string)
    default = [ "dev","test" ]
}