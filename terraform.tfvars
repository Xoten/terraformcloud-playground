virginia_cidr = "10.10.0.0/16"
# public_subnet = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

# virginia_cidr = {

#   "prod" = "10.10.0.0/16"
#   "dev"  = "172.16.0.0/16" // en caso de probar esto
#   //tambien se deberian modificar las subnets
# }

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env" = "dev"
  "owner" = "Alejandro"
  "cloud" = "AWS"
  "IAC" = "Terraform"
  "IAC_version" = "1.7.5" 
  "project" = "cerberus"
  "region"  = "virginia"
 }

sg_ingress_cidr = "0.0.0.0/0" #Se podria ser más especifico poniendo la dirección Ip pública de nuestra casa

ec2_specs = {

  "ami" = "ami-00beae93a2d981137"
  "instance_type" = "t2.micro"

}

enable_monitoring = 0
ingress_ports_list= [22,80,443]