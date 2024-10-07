provider "aws" {
   region = "ap-south-1"
  
}

module "ec2_instance" {
   source = "./Day-3/modules/ec2_instance"
   ami_value = "ami-0522ab6e1ddcc7055"
   instance_type_value = "t2.micro"
   subnet_id_value = "subnet-0432b559b5569e30e"
}