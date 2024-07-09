variable "ami" {
    type = string
    default = ""  
}
variable "instance_type" {
    type = string
    default = ""  
}
variable "key_name" {
    type = string
    default = ""
}
variable "tags" {
  description = "A mapping of tags to assign to the resource"
  type        = map(string)
  default     = {}
}