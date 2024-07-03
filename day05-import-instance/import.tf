resource "aws_instance" "import" {
    ami = "ami-01376101673c89611"
    instance_type = "t2.micro"
    tags = {
      Name = "instance-import"
    }

    #{when we doing with terraform import we should mention that anything like {ami-id,instance-type,tags} 
    #existing instances only which your create manualy
    #we can controll the cloud instances form locally by using terrform import and cli also
    # this is the command to use
    #first (terraform init)
    #second (terraform import aws_instance.import <existing instance-id>)
    #third (terraform apply -auto-approve) to do any changes we can do this command
    #while you can do any change by using manual process that can be done by terraform for 
    #(ex: tags,instance-type)
    #terraform can controll the existing instance 
    #when we are calling terraform import the statefile will update in locally and from there it take 
    #action for existing instance
    #by using of terraform import we can control the instance which we are created in manual process
    #we can destroy the instance by using terrraform which we created by manual process
    #it will done by after import only}    
}